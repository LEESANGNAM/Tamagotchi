//
//  Extension+UILabel.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/05.
//

import UIKit

extension UILabel{
    func setInfoLabel(){
        self.font = .systemFont(ofSize: 13)
        self.textAlignment = .center
        self.textColor = BaseColor.fontColor
        self.numberOfLines = 0
    }
    
    func setNameLabel(){
        self.font = .systemFont(ofSize: 15)
        self.textAlignment = .center
        self.textColor = BaseColor.fontColor
        
        self.layer.borderColor = BaseColor.borderColor
        self.layer.borderWidth = 1
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
    }
}
