// Copyright © 3/5/20 Antônio Carlos. All rights reserved.

import Foundation

struct FetchPlayerDTO {
    let name: String
    let email: String
    let firestoreUID: String
}

extension FetchPlayerDTO {

    init?(_ dic: [String: Any]) {

        guard let name = dic["name"] as? String,
            let email = dic["email"] as? String,
            let firestoreUID = dic["firestoreUID"] as? String else { return nil }

        self.name = name
        self.email = email
        self.firestoreUID = firestoreUID
    }
}
