//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/05.
//

import Foundation
import UIKit

enum TamagotchiType {
    case ttakkeum
    case bangsil
    case banjjag
    case none
    
    var image: UIImage? {
        switch self {
        case .ttakkeum:
            return UIImage(named: "1-5")
        case .bangsil:
            return UIImage(named: "2-5")
        case .banjjag:
            return UIImage(named: "3-5")
        case .none:
            return UIImage(named: "noImage")
        }
    }
    
    var name: String {
        switch self{
        case .ttakkeum:
            return "따끔따끔 다마고치"
        case .bangsil:
            return "방실방실 다마고치"
        case .banjjag:
            return "반짝반짝 다마고치"
        case .none:
            return "준비중입니다."
        }
    }
    
    
}


struct Tamagotchi {
    var type: TamagotchiType
    var name: String {
        return type.name
    }
    var rice = 0
    var water = 0
    var lavel: Int {
        return ((rice / 5) + (water / 2)) / 10
    }
}
