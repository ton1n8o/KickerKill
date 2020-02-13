// Copyright © 10/19/19 Antônio Carlos. All rights reserved.

import UIKit

extension UICollectionView {

    func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T where T : Identifiable {

        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Couldn't find UICollectionViewCell for \(T.identifier)")
        }
        return cell
    }
}
