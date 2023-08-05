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
    
    var contens: String{
        switch self{
        case .ttakkeum:
            return "저는 선인장 다마고치입니다. 키는 2cm 몸무게는 150g 이에요. 성격은 소심하지만 마음은 따뜻해요. 열심히 잘 먹고 잘 클 자신은 있답니다. 반가워요 주인님~:)"
        case .bangsil:
            return "저는 방실방실 다마고치입니당! 키는 100km 몸무게는 150톤이에용! 성격은 화끈하고 날라다닙니당! 열심히 잘 먹고 잘 클 자신은 있답니당! 방실방실! "
        case .banjjag:
            return "저는 반짝반짝 다마고치에요~ 키는 120cm 몸무게는 120g이에요~ 성격도 반짝반짝 시원시원 해요~ 저를 키워주세요~ 잘 먹고 잘 커볼게요~"
        case .none:
            return " 준비중이에요 ~ 조금만 기다려주세요! 곧 찾아 오겠습니다 :)"
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
