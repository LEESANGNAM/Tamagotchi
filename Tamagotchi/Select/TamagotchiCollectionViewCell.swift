//
//  TamagotchiCollectionViewCell.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/04.
//

import UIKit

class TamagotchiCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var TamagotchiIamageView: UIImageView!
    
    @IBOutlet weak var TamagotchiNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        TamagotchiIamageView.layer.cornerRadius = 40
        TamagotchiIamageView.layer.masksToBounds = true
        
        TamagotchiNameLabel.setNameLabel()
        // Initialization code
    }

}
