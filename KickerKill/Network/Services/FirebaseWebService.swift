// Copyright © 2020 TNTStudios. All rights reserved.

import Foundation
import FirebaseFirestore

final class FirebaseWebService: WebService {

    private let firestore = Firestore.firestore()

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

    func createOrUpdate(document: [String : Any],
                        documentPath: String,
                        completion: @escaping WebServiceCompletion) {

        let collectionReference = firestore.document(documentPath)

        collectionReference.setData(document) { error in
            if let error = error {
                completion(.failure(error)) //TODO: in case of error, a user was not created! (cover PlayerServiceImpl with tests)
            } else {
                completion(.success(()))
            }
        }
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

}
