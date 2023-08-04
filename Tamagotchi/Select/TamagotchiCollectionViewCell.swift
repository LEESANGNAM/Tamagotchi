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
        TamagotchiNameLabel.font = .systemFont(ofSize: 13)
        TamagotchiNameLabel.textAlignment = .center
        TamagotchiNameLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        TamagotchiNameLabel.layer.borderColor = CGColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        TamagotchiNameLabel.layer.borderWidth = 1
        TamagotchiNameLabel.layer.masksToBounds = true
        TamagotchiNameLabel.layer.cornerRadius = 5
        // Initialization code
    }

}
