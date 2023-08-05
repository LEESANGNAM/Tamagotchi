//
//  Extension_UIViewController.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/06.
//

import UIKit

extension UIViewController{
    
    func showAlert(text: String){
        let alert = UIAlertController(title: "경고!", message: text, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "확인", style: .destructive)
        
        alert.addAction(cancel)
        
        present(alert, animated: true)
        
    }
}
