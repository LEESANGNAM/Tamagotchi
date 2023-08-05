//
//  DetailViewController.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/05.
//

import UIKit

class DetailViewController: UIViewController {
    
    var tamagotchiDetail: Tamagotchi!

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailContentsLabel: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var selectButton: UIButton!
    
    @IBOutlet weak var backView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        selectButton.alertButtonDesing(title: "선택하기")
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        if case .none = tamagotchiDetail.type{  print("\(tamagotchiDetail.type)")
            showAlert(text: "준비중입니다.")
            return
        }
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
        
        vc.tamagotchi = tamagotchiDetail
        setData(tamagotchi: tamagotchiDetail)
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .overFullScreen
        
        present(nav, animated: true)
    }
    
    func setData(tamagotchi: Tamagotchi){
        let UserDefault = UserDefaults.standard
        UserDefault.set(tamagotchi.name, forKey: "\(tamagotchi.key)name")
        
    }
    
    
    

}
