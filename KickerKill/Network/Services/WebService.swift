// Copyright © 2020 TNTStudios. All rights reserved.

import Foundation

typealias WebServiceResult = Result<Void, Error>
typealias WebServiceCompletion = (WebServiceResult) -> Void

protocol WebService {
    
    func createDocument(_ documentData: [String: Any],
                        intoCollection path: String,
                        completion: @escaping WebServiceCompletion)
}
