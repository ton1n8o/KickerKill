// Copyright © 2020 TNTStudios. All rights reserved.

import Foundation

typealias WebServiceResult = Result<Void, Error>
typealias WebServiceCompletion = (WebServiceResult) -> Void

protocol WebService {
    
    func createDocument(_ documentData: [String: Any],
                        intoCollection path: String,
                        completion: @escaping WebServiceCompletion)

    func createOrUpdate(document: [String : Any],
                        documentPath: String,
                        completion: @escaping WebServiceCompletion)

    func fetchDocument(firestoreUID: String,
                       from collection: String,
                       completion: @escaping (Result<[String: Any]?, Error>) -> Void)
}
