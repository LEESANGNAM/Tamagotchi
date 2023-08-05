//
//  SettingEnum.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/06.
//

import Foundation

enum Setting: Int{
    case myName
    case changTamagotchi
    case resetData
    
    var image: String{
        switch self{
        case .myName:
            return "pencil"
        case .changTamagotchi:
            return "moon.fill"
        case .resetData:
            return "arrow.clockwise"
        }
    }
    
}

