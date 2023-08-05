//
//  SettingEnum.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/06.
//

import Foundation

enum Setting: Int, CaseIterable{
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
    
    var text: String{
        switch self{
        case .myName:
            return "내 이름 설정하기"
        case .changTamagotchi:
            return "다마고치 변경하기"
        case .resetData:
            return "데이터 초기화"
        }
    }
    
}

