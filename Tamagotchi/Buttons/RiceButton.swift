//
//  RiceButton.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/22.
//

import UIKit

@IBDesignable
class RiceButton: UIButton{
    
    @IBInspectable var corner: CGFloat{
        get{ return layer.cornerRadius }
        set{ layer.cornerRadius = newValue }
    }
    
    @IBInspectable var borderWidth: CGFloat{
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    @IBInspectable var borderColor: UIColor{
        get { return UIColor(cgColor: layer.borderColor!) }
        set { layer.borderColor = newValue.cgColor }
    }
    
}
