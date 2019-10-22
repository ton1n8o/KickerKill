// Copyright © 9/7/19 Antônio Carlos. All rights reserved.

import UIKit

final class SoundEffectsViewController: UIViewController {

    @IBOutlet var collectinView: UICollectionView!
    var presenter: SoundEffectsPresenterInterface!

    private let sectionInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    private var cellItemSpace: CGFloat { return 8 }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectinView.register(SoundItemCollectionViewCell.nib,
                               forCellWithReuseIdentifier: SoundItemCollectionViewCell.identifier)
        presenter.viewDidLoad()
    }

}
extension SoundEffectsViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let landscape = view.frame.width > view.frame.height
        let width = view.frame.width
        let items: CGFloat = landscape ? 5 : 3

        let leftInset: CGFloat = sectionInsets.left
        let rightInset: CGFloat = sectionInsets.right
        let insets = leftInset + rightInset
        let dimension = Int((width - ((items - 1) * cellItemSpace + insets)) / items)

        return CGSize(width: dimension, height: dimension)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {

        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellItemSpace
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellItemSpace
    }
}
extension SoundEffectsViewController: SoundEffectsViewInterface {
    
    func reloadData() {
        collectinView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension SoundEffectsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presenter.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: SoundItemCollectionViewCell.self, for: indexPath)
        cell.backgroundColor = .systemGreen
        cell.configWith(presenter.item(at: indexPath))
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension SoundEffectsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            let selectedView = UIView()
            selectedView.backgroundColor = .red
            cell.selectedBackgroundView = selectedView
            UIView.animate(withDuration: 0.5, animations: {
                cell.selectedBackgroundView?.alpha = 0.0
            }, completion: { _ in
                collectionView.deselectItem(at: indexPath, animated: false)
            })
        }
        presenter.didSelecItem(presenter.item(at: indexPath))
    }
}
