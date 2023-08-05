//
//  SettingTableViewCell.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/06.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var settingLeftIamge: UIImageView!
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var settingNickNameLabel: UILabel!
    @IBOutlet weak var settingRightIamge: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpTableViewCellUI()
    }
    
    func setUpTableViewCellUI(){
        backView.backgroundColor = .clear
        settingLeftIamge.tintColor = .black
        settingLabel.textColor = .black
        settingNickNameLabel.textColor = BaseColor.fontColor
        settingRightIamge.tintColor = BaseColor.fontColor
        settingRightIamge.image = UIImage(systemName: "chevron.forward")
    }
    
    
    func setTableViewCell(settingCase: Setting){
        let nickName = UserDefaults.standard.string(forKey: "nickname")
        settingLeftIamge.image = UIImage(systemName: settingCase.image)
        settingLabel.text = settingCase.text
        if settingCase.rawValue == 0 {
            settingNickNameLabel.text = nickName ?? "대장"
        }else{
            settingNickNameLabel.text = ""
        }
    }
    
}
