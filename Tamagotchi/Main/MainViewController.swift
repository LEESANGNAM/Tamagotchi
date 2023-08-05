//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/05.
//

import UIKit

class MainViewController: UIViewController {

    let UserDefault = UserDefaults.standard
    var tamagotchi: Tamagotchi!
    @IBOutlet weak var talkImageView: UIImageView!
    @IBOutlet weak var talkLabel: UILabel!
    
    @IBOutlet weak var tamagotchiImageView: UIImageView!
    @IBOutlet weak var tamagotchiNameLabel: UILabel!
    
    @IBOutlet weak var tamagotchiLevelLabel: UILabel!
    @IBOutlet weak var tamagotchiRiceLabel: UILabel!
    @IBOutlet weak var tamagotchiWaterLabel: UILabel!
    
    @IBOutlet weak var riceTextField: UITextField!
    @IBOutlet weak var riceButton: UIButton!
    
    
    @IBOutlet weak var waterTextField: UITextField!
    @IBOutlet weak var waterButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNaviGationBar()
        setUpTamagotchi()
        setUpTamagotchiLabel()
        setUpButton()
        setUpTalk()
        setUpTextField()
        getNickName()
        // Do any additional setup after loading the view.
    }
    
    func getNickName(){
        let nickName = UserDefault.string(forKey: "nickname")
        
        navigationItem.title = "\(nickName ?? "대장")님의 다마고치"
    }
    
    
    @IBAction func riceButtonTapped(_ sender: UIButton) {
        var riceCount = UserDefault.integer(forKey: "\(tamagotchi.key)rice")
        riceCount += getTextFieldValue(textField: riceTextField)
        UserDefault.set(riceCount, forKey: "\(tamagotchi.key)rice")
        
        setUpTamagotchiLabel()
        setUpTamagotchi()
    }
    
    @IBAction func waterButtonTapped(_ sender: UIButton) {
        var waterCount = UserDefault.integer(forKey: "\(tamagotchi.key)water")
        waterCount += getTextFieldValue(textField: waterTextField)
        UserDefault.set(waterCount, forKey: "\(tamagotchi.key)water")
        
        setUpTamagotchiLabel()
        setUpTamagotchi()
    }
    
    func getTextFieldValue(textField: UITextField) -> Int {
        guard let text = textField.text, !text.isEmpty else { return 1 }
        guard let num = Int(text) else {
            showAlert(text: "\(text)는 숫자가 아님 alert 띄울예정")
            textField.text = ""
            return 0
        }
        let limit = textFieldLimit(textFiled: textField)
        
        if num >= limit {
            showAlert(text: "\(limit)미만으로 입력가능 alert 띄울 예정")
            textField.text = ""
            return 0
        }else{
            return num
        }
    }
    
    func textFieldLimit(textFiled: UITextField) -> Int{
        if textFiled == riceTextField{
            return 100
        }else{
            return 50
        }
    }
}

// MARK: - UI
extension MainViewController{
    
    
    func setUpNaviGationBar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(setting))
        navigationController?.navigationBar.barTintColor = BaseColor.fontColor
                navigationController?.navigationBar.tintColor = BaseColor.fontColor
    }
    @objc func setting(){
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func setUpTamagotchi(){
        let riceCount = UserDefault.integer(forKey: "\(tamagotchi.key)rice")
        let waterCount = UserDefault.integer(forKey: "\(tamagotchi.key)water")
        let tamagotchiName = UserDefault.string(forKey: "\(tamagotchi.key)name")
        var level = tamagotchi.getLevel(rice: riceCount, water: waterCount)
        level = level >= 10 ? 9 : level
        
        tamagotchiNameLabel.text = tamagotchiName
        tamagotchiNameLabel.setNameLabel()
        tamagotchiImageView.image = UIImage(named: "\(tamagotchi.key)-\(level)")
    }
    
    func setUpTamagotchiLabel(){
        let riceCount = UserDefault.integer(forKey: "\(tamagotchi.key)rice")
        let waterCount = UserDefault.integer(forKey: "\(tamagotchi.key)water")
        let level = tamagotchi.getLevel(rice: riceCount, water: waterCount)
        
        
        tamagotchiLevelLabel.text = "LV\(level)"
        tamagotchiLevelLabel.setInfoLabel()
        tamagotchiRiceLabel.text = "밥알\(riceCount)개"
        tamagotchiRiceLabel.setInfoLabel()
        tamagotchiWaterLabel.text = "물방울 \(waterCount)개"
        tamagotchiWaterLabel.setInfoLabel()
        
    }
    
    func setUpButton(){
        waterButton.eatButtonDesing(title: "물먹기", systemImage: "leaf.circle")
        riceButton.eatButtonDesing(title: "밥먹기", systemImage: "drop.circle")
    }
    
    func setUpTalk(){
        talkImageView.image = UIImage(named: "bubble")
        talkLabel.text = "말풍선 대화 추가예정입니다."
        talkLabel.setInfoLabel()
    }
    
    func setUpTextField(){
        riceTextField.textFieldNumberDesign(palceholder: "밥줘요")
        waterTextField.textFieldNumberDesign(palceholder: "물줘요")
    }
}
