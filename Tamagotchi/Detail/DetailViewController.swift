//
//  DetailViewController.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/05.
//

import UIKit

class DetailViewController: UIViewController {
    let UserDefault = UserDefaults.standard
    var tamagotchiDetail: Tamagotchi!
    var text = ""
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailContentsLabel: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var selectButton: UIButton!
    
    @IBOutlet weak var backView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let isSelect = UserDefaultsHelper.standard.isSelect
        if isSelect{
            text = "변경하기"
        }else{
            text = "선택하기"
        }
        setUpUI()
        // Do any additional setup after loading the view.
    }
    
    func setUpUI(){
        
        backView.backgroundColor = BaseColor.backgroundColor
        detailNameLabel.setNameLabel()
        detailContentsLabel.setInfoLabel()
        
        detailImageView.layer.cornerRadius = detailImageView.bounds.width / 2
        detailImageView.layer.masksToBounds = true
        
        detailImageView.image = tamagotchiDetail.type.image
        
        detailNameLabel.text = tamagotchiDetail.type.name
        detailContentsLabel.text = tamagotchiDetail.type.contens
        
        
        cancelButton.alertButtonDesing(title: "취소")
        selectButton.alertButtonDesing(title: text)
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        let tamagochName = UserDefaultsHelper.standard.name
        if case .none = tamagotchiDetail.type{  print("\(tamagotchiDetail.type)")
            showAlert(text: "준비중입니다.")
            return
        }else if !tamagochName.isEmpty, tamagochName == tamagotchiDetail.name {
            showAlert(text: "이미키우고있는 다마고치입니다.")
            return
        }
        changeRootView()
    }
    
    func changeRootView(){
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        UserDefaultsHelper.standard.isSelect = true
        setData(tamagotchi: tamagotchiDetail)
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: MainViewController.identifier) as? MainViewController else { return }
        let nav = UINavigationController(rootViewController: vc)
        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
    }
    
    func setData(tamagotchi: Tamagotchi){
        UserDefaultsHelper.standard.name = tamagotchi.name
        
    }
    
    
    

}
