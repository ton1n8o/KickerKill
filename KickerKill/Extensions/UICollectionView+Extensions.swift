// Copyright © 10/19/19 Antônio Carlos. All rights reserved.

import UIKit

extension UICollectionView {

    func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {

        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reusableCellIdentifier, for: indexPath) as? T else {
            assertionFailure("Couldn't find UICollectionViewCell for \(T.reusableCellIdentifier)")
            return T()
        }
        return cell
    }
}
