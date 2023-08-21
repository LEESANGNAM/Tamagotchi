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
        let nickName = UserDefaultsHelper.standard.nickname
        setUpMessage(nickname: nickName)
        navigationItem.title = "\(nickName)님의 다마고치"
    }
    
    
    @IBAction func riceButtonTapped(_ sender: UIButton) {
        eatButtonCountUp(sender: sender)
    }
    
    @IBAction func waterButtonTapped(_ sender: UIButton) {
        eatButtonCountUp(sender: sender)
    }
    
    @IBAction func tapGustureKeyboadDown(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    func eatButtonCountUp(sender: UIButton){
        if sender.tag == 0{
            var riceCount = UserDefaultsHelper.standard.rice
            riceCount += getTextFieldValue(textField: riceTextField)
            UserDefaultsHelper.standard.rice = riceCount
        }else{
            var waterCount = UserDefaultsHelper.standard.water
            waterCount += getTextFieldValue(textField: waterTextField)
            UserDefaultsHelper.standard.water = waterCount
        }
        talkLabel.text = Message.messge.randomElement()
        setUpTamagotchi()
    }
    
    
    
    
    func getTextFieldValue(textField: UITextField) -> Int {
        guard let text = textField.text, !text.isEmpty else { return 1 }
        guard let num = Int(text) else {
            showAlert(text: "\(text) 말고 숫자를 입력해주세요 ")
            textField.text = ""
            return 0
        }
        
        let limit = textFieldLimit(textFiled: textField)
        
        if num >= limit {
            showAlert(text: "\(limit)미만으로 입력가능")
            textField.text = ""
            return 0
        }else if num < 0 {
            showAlert(text: "ㅠㅠ 제 밥 뺏어가지마세요. 0이상 입력해주세요.")
            textField.text = ""
            return 0
        }
        else{
            textField.text = ""
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
        guard let vc = sb.instantiateViewController(withIdentifier: SettingViewController.identifier) as? SettingViewController else { return }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func setUpTamagotchi(){
        let tamagotchiName = UserDefaultsHelper.standard.name
        let riceCount = UserDefaultsHelper.standard.rice
        let waterCount = UserDefaultsHelper.standard.water
        let tamagotchiType = Tamagotchi.getType(name: tamagotchiName)
        var level = Tamagotchi.getLevel(rice: riceCount, water: waterCount)
        
        // 이름
        tamagotchiNameLabel.text = tamagotchiName
        tamagotchiNameLabel.setNameLabel()
        // 레벨 밥,물 등 정보
        tamagotchiLevelLabel.text = "LV\(level)"
        tamagotchiLevelLabel.setInfoLabel()
        tamagotchiRiceLabel.text = "밥알\(riceCount)개"
        tamagotchiRiceLabel.setInfoLabel()
        tamagotchiWaterLabel.text = "물방울 \(waterCount)개"
        tamagotchiWaterLabel.setInfoLabel()
        // 이미지
        level = level >= 10 ? 9 : level
        tamagotchiImageView.image = UIImage(named: "\(tamagotchiType.rawValue)-\(level)")
    }
    
    
    func setUpButton(){
        riceButton.eatButtonDesing(title: "밥먹기", systemImage: "leaf.circle")
        riceButton.tag = 0
        waterButton.eatButtonDesing(title: "물먹기", systemImage: "drop.circle")
        waterButton.tag = 1
        
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


