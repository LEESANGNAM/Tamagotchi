//
//  Extension+UIButton.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/05.
//

import UIKit

extension UIButton{
    
    func alertButtonDesing(title: String){
        self.tintColor = BaseColor.fontColor
        self.setTitle(title, for: .normal)
        self.layer.borderWidth = 1
        self.layer.borderColor = BaseColor.borderColor
    }
    
    func eatButtonDesing(title: String, systemImage: String){
        self.tintColor = BaseColor.fontColor
        self.setImage(UIImage(systemName: systemImage), for: .normal)
        self.setTitle(title, for: .normal)
        self.layer.borderWidth = 1
        self.layer.borderColor = BaseColor.borderColor
        self.layer.cornerRadius = 5
    }
}
