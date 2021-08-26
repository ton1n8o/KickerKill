//  Copyright © 2021 TNTStudios. All rights reserved.

import UIKit

// MARK: UITableView

extension UITableView {

    func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reusableCellIdentifier, for: indexPath) as? T else {
            assertionFailure("Couldn't find Cell for \(T.reusableCellIdentifier)")
            return T()
        }
        return cell
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(withClass name: T.Type) -> T {

        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: T.reusableCellIdentifier) as? T else {
            assertionFailure("Couldn't find a UITableViewHeaderFooterView for \(T.reusableCellIdentifier)")
            return T()
        }
        return cell
    }

    func registerByCellNib<T: UITableViewCell>(_ cellClass: T.Type) {
        register(T.nib, forCellReuseIdentifier: T.reusableCellIdentifier)
    }

    func registerByCellClass<T: UITableViewCell>(_ cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: T.reusableCellIdentifier)
    }
}
