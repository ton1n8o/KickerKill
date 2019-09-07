//
//  UIStoryboardExtension.swift
//  KickerKill
//
//  Created by Antonio on 9/7/19.
//  Copyright © 2019 Antonio Carlos. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    func instantiateViewController<T: UIViewController>(ofType _: T.Type, withIdentifier identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: T.self)
        return instantiateViewController(withIdentifier: identifier) as! T
    }
    
}
