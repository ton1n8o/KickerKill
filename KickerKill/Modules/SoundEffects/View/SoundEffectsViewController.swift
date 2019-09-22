// Copyright © 9/7/19 Antônio Carlos. All rights reserved.

import UIKit

final class SoundEffectsViewController: UIViewController {

    @IBOutlet var collectinView: UICollectionView!
    var presenter: SoundEffectsPresenterInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectinView.register(UINib(nibName: "SoundItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        presenter.viewDidLoad()
    }

}
extension SoundEffectsViewController: SoundEffectsViewInterface {
    
    func reloadData() {
        collectinView.reloadData()
    }
}
extension SoundEffectsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SoundItemCollectionViewCell
        cell.configWith(presenter.item(at: indexPath))
        return cell
    }
    
}
extension SoundEffectsViewController: UICollectionViewDelegate {
    
}
