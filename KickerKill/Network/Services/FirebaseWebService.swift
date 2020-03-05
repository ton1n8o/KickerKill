// Copyright © 2020 TNTStudios. All rights reserved.

import Foundation
import FirebaseFirestore

final class FirebaseWebService: WebService {

    private let firestore = Firestore.firestore()

    func createDocument(_ documentData: [String : Any], intoCollection path: String, completion: @escaping WebServiceCompletion) {

        let collectionReference = firestore.collection(path)

        collectionReference.document().setData(documentData) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
