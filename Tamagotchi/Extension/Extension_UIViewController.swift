//
//  Extension_UIViewController.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/06.
//

import UIKit

extension UIViewController{
    func showAlert(text: String, addButtonText: String? = nil, Action: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "경고!", message: text, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .destructive)
        alert.addAction(cancel)
        
        if let buttonText = addButtonText {
            let customAction = UIAlertAction(title: buttonText, style: .default) { _ in
                Action?()
            }
            alert.addAction(customAction)
        }
        
        present(alert, animated: true)
    }
}
