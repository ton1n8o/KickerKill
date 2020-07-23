// Copyright © 3/12/20 Antônio Carlos. All rights reserved.

import Foundation
@testable import KickerKill

final class MockWebService: WebService, HasInvocations {

    enum Invocation: FakeEquatable {
        case createOrUpdate([String : Any], documentPath: String)
    }
    var invocations: [Invocation] = []

    func createDocument(_ documentData: [String : Any], intoCollection path: String, completion: @escaping WebServiceCompletion) {

    }

    var resultCreateOrUpdate: Error?
    func createOrUpdate(document: [String : Any],
                        documentPath: String,
                        completion: @escaping (Error?) -> Void) {

        invocations.append(.createOrUpdate(document, documentPath: documentPath))
        completion(resultCreateOrUpdate)
    }

    func fetchDocument(firestoreUID: String, from collection: String, completion: @escaping (Result<[String : Any]?, Error>) -> Void) {

    }

    func fetchDocumentsFrom(collectionPath: String, queryParams: PlayerServiceQueryParams, completion: @escaping (Result<[[String : Any]], Error>) -> Void) {

    }
}
