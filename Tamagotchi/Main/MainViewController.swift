//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/05.
//

import UIKit

class MainViewController: UIViewController {

    let UserDefault = UserDefaults.standard
    var tamagotchi = Tamagotchi(type: .ttakkeum)
    
    @IBOutlet weak var talkImageView: UIImageView!
    @IBOutlet weak var TalkLabel: UILabel!
    
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
        setUpTamagotchi()
        setUpTamagotchiLabel()
        setUpButton()
        setUpTalk()
        // Do any additional setup after loading the view.
    }
    
    
    
    func setUpTamagotchi(){
        let level = tamagotchi.getLavel()
        let tamagotchiName = UserDefault.string(forKey: "\(tamagotchi.key)name")
        tamagotchiNameLabel.text = tamagotchiName
        tamagotchiImageView.image = UIImage(named: "\(tamagotchi.key)-\(level)")
    }
    
    func setUpTamagotchiLabel(){
        let riceCount = UserDefault.integer(forKey: "\(tamagotchi.key)rice")
        let waterCount = UserDefault.integer(forKey: "\(tamagotchi.key)water")
        
        tamagotchiLevelLabel.text = "LV\(tamagotchi.getLavel())"
        tamagotchiRiceLabel.text = "밥알 \(riceCount)개"
        tamagotchiWaterLabel.text = "물방울 \(waterCount)개"
    }
    
    func setUpButton(){
        waterButton.eatButtonDesing(title: "물먹기", systemImage: "leaf.circle")
        riceButton.eatButtonDesing(title: "밥먹기", systemImage: "drop.circle")
    }
    
    func setUpTalk(){
        talkImageView.image = UIImage(named: "bubble")
        TalkLabel.textAlignment = .center
        TalkLabel.numberOfLines = 0
        TalkLabel.text = "말풍선 대화 추가예정입니다."
    }
    
    

    
}
