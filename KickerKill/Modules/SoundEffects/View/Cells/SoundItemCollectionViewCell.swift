// Copyright © 9/14/19 Antônio Carlos. All rights reserved.

import UIKit

final class SoundItemCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet var audioName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configWith(_ item: SoundEffectData) {
        audioName.text = item.title
    }
}

extension SoundItemCollectionViewCell: Identifiable {
    
}
