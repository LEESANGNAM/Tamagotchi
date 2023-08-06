//
//  UserDefaltKey.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/06.
//

import Foundation


enum UserDefaultsKey{
    case isSelect , name, rice, water, nickname
    
    var key: String{
        switch self{
        case .isSelect:
            return "isSelect"
        case .name:
            return "name"
        case .rice:
            return "rice"
        case .water:
            return "water"
        case .nickname:
            return "nickname"
        }
    }
}
