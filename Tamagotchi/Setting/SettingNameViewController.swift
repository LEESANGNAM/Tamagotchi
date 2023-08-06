//
//  SettingNameViewController.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/06.
//

import UIKit

class SettingNameViewController: UIViewController {

    
    @IBOutlet weak var nameSettingTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameSettingTextField.placeholder = "대장님 이름을 말하세요!"
        setUpNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    func setUpNavigationBar(){
        navigationItem.title = "대장님 이름 설정"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(setName))
        
    }
    
    @objc func setName(){
        guard let text = nameSettingTextField.text, !text.isEmpty else {
            return
        }
        if text.count < 2 {
            showAlert(text: "닉네임을 두글자 이상 해주세요")
        }else if text.count > 6 {
            showAlert(text: "닉네임은 6글자 이하로 가능합니다")
        }else{
            UserDefaults.standard.set(text, forKey: UserDefaultsKey.nickname.key)
        }
        
        navigationController?.popViewController(animated: true)
    }

  

}
