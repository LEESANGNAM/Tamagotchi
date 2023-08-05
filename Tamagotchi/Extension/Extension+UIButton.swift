//
//  Extension+UIButton.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/05.
//

import UIKit

extension UIButton{
    func eatButtonDesing(title: String, systemImage: String){
        self.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        self.setImage(UIImage(systemName: systemImage), for: .normal)
        self.setTitle(title, for: .normal)
        self.layer.borderWidth = 1
        self.layer.borderColor = CGColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        self.layer.cornerRadius = 5
    }
}
