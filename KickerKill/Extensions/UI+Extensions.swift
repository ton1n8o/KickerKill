//  Copyright © 2018 TNTStudios. All rights reserved.

import UIKit

extension UIViewController {
    
    /// Present a UIAlertController with the given parameters.
    ///
    /// - Parameters:
    ///   - withTitle: a title to show, 'Info' in case nil.
    ///   - withMessage: a message to show.
    ///   - alertAction: an UIAlertAction to dismiss the alertController.
    func showInfo(
        withTitle: String = CommonMessages.info.localized,
        withMessage: String,
        alertAction: UIAlertAction) {
        
        let ac = UIAlertController(title: withTitle, message: withMessage, preferredStyle: .alert)
        ac.addAction(alertAction)
        
        present(ac, animated: true)
    }
    
    func showConfirm(
        withTitle: String = CommonMessages.info.localized,
        withMessage: String,
        positiveAction: UIAlertAction,
        negativeAction: UIAlertAction) {
        
        let ac = UIAlertController(title: withTitle, message: withMessage, preferredStyle: .alert)
        ac.addAction(negativeAction)
        ac.addAction(positiveAction)
        
        present(ac, animated: true)
    }
    
    func showEndlessActivityIndicator() -> () -> Void {
        
        guard let keyWindow = UIApplication.shared.windows.first else { return {} }
        
        let backgroundView = UIView()
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.style = .whiteLarge
        
        // setting up dark background
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0.7
        backgroundView.isUserInteractionEnabled = true
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        keyWindow.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: keyWindow.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: keyWindow.bottomAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: keyWindow.trailingAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: keyWindow.leadingAnchor)
            ])
        
        activityIndicatorView.isUserInteractionEnabled = true
        keyWindow.addSubview(activityIndicatorView)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: keyWindow.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: keyWindow.centerYAnchor)
            ])
        activityIndicatorView.startAnimating()
        
        return {
            backgroundView.removeFromSuperview()
            activityIndicatorView.removeFromSuperview()
        }
    }
}

extension UIColor {
    static let lightBlue: UIColor = #colorLiteral(red: 0.9019607843, green: 0.937254902, blue: 0.968627451, alpha: 1)
    static let grayBlue: UIColor  = #colorLiteral(red: 0.9246864915, green: 0.9254901961, blue: 0.9247950912, alpha: 1)
}

extension CALayer {
    
    func roundCorners(radius: CGFloat = 4) {
        cornerRadius = radius
    }
}
