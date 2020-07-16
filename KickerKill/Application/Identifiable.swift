// Copyright © 10/13/19 Antônio Carlos. All rights reserved.

import UIKit

protocol Identifiable: class {    
    static var identifier: String { get }
    static var nib: UINib { get }
}

extension Identifiable {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
