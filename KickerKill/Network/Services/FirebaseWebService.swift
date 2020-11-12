// Copyright © 2020 TNTStudios. All rights reserved.

import Foundation
import FirebaseFirestore

final class FirebaseWebService: WebService {

    private let firestore = Firestore.firestore()
    private var lastDocument: QueryDocumentSnapshot?

    init() {
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = false
        firestore.settings = settings
    }

    func createDocument(_ documentData: [String : Any],
                        intoCollection path: String,
                        completion: @escaping WebServiceCompletion) {

        let collectionReference = firestore.collection(path)

        collectionReference.document().setData(documentData) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }

    private var listener: ListenerRegistration?

    func createOrUpdate(document: [String : Any],
                        documentPath: String,
                        completion: @escaping (Error?) -> Void) {

        let collectionReference = firestore.document(documentPath)

        listener = collectionReference.addSnapshotListener { [weak self] (docSnapShot, error) in

            self?.listener?.remove()

            guard error == nil else {
                completion(error)
                return
            }

            guard docSnapShot != nil else {
                let userInfo = [NSLocalizedDescriptionKey: "could not update document: \(documentPath)"]
                let error = NSError(domain: "error", code: 0, userInfo: userInfo)
                completion(error)
                return
            }
            completion(nil)
        }

        collectionReference.setData(document)
    }

    func fetchDocument(firestoreUID: String,
                       from collection: String,
                       completion: @escaping (Result<[String: Any]?, Error>) -> Void) {
        
        let collectionReference = firestore.collection(collection)
        
        collectionReference
            .whereField("firestoreUID", isEqualTo: firestoreUID)//TODO: can be more generic
            .getDocuments { querySnapshot, error in
                
                if let error = error {
                    completion(.failure(error))
                    return
                }
                let document = querySnapshot?.documents.first?.data()
                completion(.success(document))
        }
    }

    func fetchDocumentsFrom(collectionPath: String,
                            queryParams: PlayerServiceQueryParams,
                            completion: @escaping (Result<[[String: Any]], Error>) -> Void) {

        if queryParams.firstPage {
            lastDocument = nil
        }

        var query = firestore
            .collection(collectionPath)
            .limit(to: queryParams.limit)

        queryParams.orderBy.forEach { order in
            query = query.order(by: order.field, descending: order.descending)
        }
        queryParams.filterBy.forEach { filter in
            query = query.whereField(filter.field, isEqualTo: filter.value)
        }

        if let document = lastDocument {

            query.start(afterDocument: document)
                .getDocuments { (querySnapshot, error) in
                    self.handle(querySnapshot, error, completion: completion)
            }
        } else {
            query.getDocuments { (querySnapshot, error) in
                self.handle(querySnapshot, error, completion: completion)
            }
        }
    }

    private func handle(_ querySnapShot: QuerySnapshot?,
                        _ error: Error?,
                        completion: @escaping (Result<[[String: Any]], Error>) -> Void) {

        if let error = error {
            completion(.failure(error))
            return
        }

        guard let querySnapShot = querySnapShot else {
            completion(.success([[:]]))
            return
        }

        lastDocument = querySnapShot.documents.last
        let fetchDocumentData = querySnapShot.documents.map { $0.data() }
        completion(.success(fetchDocumentData))
    }

}
