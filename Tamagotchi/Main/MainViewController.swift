//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/05.
//

import UIKit

class MainViewController: UIViewController {

    let UserDefault = UserDefaults.standard
   
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
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getNickName()
    }
    
    
    func getNickName(){
        let nickName = UserDefault.string(forKey: UserDefaultsKey.nickname.key) ?? "대장"
        setUpMessage(nickname: nickName)
        navigationItem.title = "\(nickName)님의 다마고치"
    }
    
    
    @IBAction func riceButtonTapped(_ sender: UIButton) {
        var riceCount = UserDefault.integer(forKey: UserDefaultsKey.rice.key)
        let nickName = UserDefault.string(forKey: UserDefaultsKey.nickname.key) ?? "대장"
        
        riceCount += getTextFieldValue(textField: riceTextField)
        UserDefault.set(riceCount, forKey: UserDefaultsKey.rice.key)
        
        setUpMessage(nickname: nickName)
        setUpTamagotchiLabel()
        setUpTamagotchi()
    }
    
    @IBAction func waterButtonTapped(_ sender: UIButton) {
        var waterCount = UserDefault.integer(forKey: UserDefaultsKey.water.key)
        let nickName = UserDefault.string(forKey: UserDefaultsKey.nickname.key) ?? "대장"
        waterCount += getTextFieldValue(textField: waterTextField)
        UserDefault.set(waterCount, forKey: UserDefaultsKey.water.key)
        
        setUpMessage(nickname: nickName)
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
        guard let tamagotchiName = UserDefault.string(forKey: UserDefaultsKey.name.key) else { return }
        let riceCount = UserDefault.integer(forKey: UserDefaultsKey.rice.key)
        let waterCount = UserDefault.integer(forKey: UserDefaultsKey.water.key)
        let tamagotchiType = Tamagotchi.getType(name: tamagotchiName)
        var level = Tamagotchi.getLevel(rice: riceCount, water: waterCount)
        level = level >= 10 ? 9 : level
        
        tamagotchiNameLabel.text = tamagotchiName
        tamagotchiNameLabel.setNameLabel()
        tamagotchiImageView.image = UIImage(named: "\(tamagotchiType.rawValue)-\(level)")
    }
    
    func setUpTamagotchiLabel(){
        let riceCount = UserDefault.integer(forKey: UserDefaultsKey.rice.key)
        let waterCount = UserDefault.integer(forKey: UserDefaultsKey.water.key)
        let level = Tamagotchi.getLevel(rice: riceCount, water: waterCount)
        
        
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
        talkLabel.setInfoLabel()
    }
    func setUpMessage(nickname: String){
        Message.setupMessages(nickname: nickname)
        talkLabel.text = Message.messge.randomElement()
    }
    
    func setUpTextField(){
        riceTextField.textFieldNumberDesign(palceholder: "밥줘요")
        waterTextField.textFieldNumberDesign(palceholder: "물줘요")
    }
}
