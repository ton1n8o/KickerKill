//  Copyright © 2021 TNTStudios. All rights reserved.

import UIKit

public extension UITableViewCell {
    static var reusableCellIdentifier: String { String(describing: self) }
    static var nib: UINib { return UINib(nibName: reusableCellIdentifier, bundle: nil) }
}