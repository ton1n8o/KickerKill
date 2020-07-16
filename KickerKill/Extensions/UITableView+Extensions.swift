// Copyright © 4/16/20 Antônio Carlos. All rights reserved.

import UIKit

// MARK: UITableView

extension UITableView {

    func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T where T: Identifiable {

        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Couldn't find UITableViewCell for \(T.identifier)")
        }
        return cell
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(withClass name: T.Type) -> T where T: Identifiable {

        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T else {
            fatalError("Couldn't find UITableViewHeaderFooterView for \(T.identifier)")
        }
        return cell
    }

    func registerCell<T: Identifiable>(_ withClass: T.Type) {
        self.register(withClass.nib, forCellReuseIdentifier: withClass.identifier)
    }
}
