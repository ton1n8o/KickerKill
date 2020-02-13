//  Copyright © 2018 TNTStudios. All rights reserved.

import Foundation

protocol Localizable {
    var localized: String { get }
}

enum CommonMessages: String, Localizable {
    
    case ok
    case noConnection
    case embarassing
    case error
    case info
    
    var localized: String {
        
        switch self {
        case .ok:
            return NSLocalizedString(
                "OK", comment: "General 'OK' label for buttons."
            )
        case .error:
            return NSLocalizedString("Error", comment: "Common error title.")
            case .info:
            return NSLocalizedString("Info", comment: "Common information title.")
        case .noConnection:
            return NSLocalizedString("No Connection", comment: "")
        case .embarassing:
            return NSLocalizedString("It's embarrassing... but", comment: "")
        }
        
    }
}
