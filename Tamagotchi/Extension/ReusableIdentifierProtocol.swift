//
//  ReusableIdentifierProtocol.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/21.
//

import UIKit


protocol ReusablViewProtocol {
    static var identifier: String { get }
}

extension UIViewController: ReusablViewProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
extension UITableViewCell: ReusablViewProtocol{
    static var identifier: String{
        return String(describing: self)
    }
}
extension UICollectionViewCell: ReusablViewProtocol{
    static var identifier: String{
        return String(describing: self)
    }
}
