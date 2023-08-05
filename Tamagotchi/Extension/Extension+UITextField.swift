//
//  Extension+UITextField.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/05.
//

import UIKit

extension UITextField{
    func textFieldNumberDesign(palceholder: String){
        self.placeholder = palceholder
        self.borderStyle = .none
        self.textAlignment = .center
        self.keyboardType = .numberPad
    }
}
