//
//  UserDefaltKey.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/06.
//

import Foundation

class UserDefaultsHelper{ // PropertyWrapper는 학습후 추가예정
    
    static let standard = UserDefaultsHelper() // 싱글턴 패턴
    
    private init(){} // 접근제어자
    
    let userDefaults = UserDefaults.standard
    
    
    enum UserDefaultsKey: String{
        case isSelect , name, rice, water, nickname
        }
}

extension UserDefaultsHelper {
    
//case isSelect , name, rice, water, nickname
    
    
    var isSelect: Bool{
        get{
            return userDefaults.bool(forKey: UserDefaultsKey.isSelect.rawValue)
        }
        set{
            userDefaults.set(newValue, forKey: UserDefaultsKey.isSelect.rawValue)
            
        }
    }
    var name: String{
        get{
            return userDefaults.string(forKey: UserDefaultsKey.name.rawValue) ?? ""
        }
        set{
            userDefaults.set(newValue, forKey: UserDefaultsKey.name.rawValue)
            
        }
    }
    var rice: Int{
        get{
            return userDefaults.integer(forKey: UserDefaultsKey.rice.rawValue)
        }
        set{
            userDefaults.set(newValue, forKey: UserDefaultsKey.rice.rawValue)
            
        }
    }
    var water: Int{
        get{
            return userDefaults.integer(forKey: UserDefaultsKey.water.rawValue)
        }
        set{
            userDefaults.set(newValue, forKey: UserDefaultsKey.water.rawValue)
            
        }
    }
    var nickname: String{
        get{
            return userDefaults.string(forKey: UserDefaultsKey.nickname.rawValue) ?? "대장"
        }
        set{
            userDefaults.set(newValue, forKey: UserDefaultsKey.nickname.rawValue)
            
        }
    }
}
