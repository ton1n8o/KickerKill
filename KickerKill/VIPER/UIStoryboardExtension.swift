// Copyright © 9/7/19 Antônio Carlos. All rights reserved.

import UIKit

extension UIStoryboard {

    func instantiateViewController<T: UIViewController>(ofType _: T.Type,
                                                        withIdentifier identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: T.self)
        return instantiateViewController(withIdentifier: identifier) as! T
    }

    static func viewController<T: UIViewController>(
        ofType _: T.Type,
        withIdentifier identifier: String? = nil,
        from storyboardNamed: String
    ) -> T {

        let storyboard = UIStoryboard(name: storyboardNamed, bundle: nil)

        let identifier = identifier ?? String(describing: T.self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
