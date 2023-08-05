//
//  DetailViewController.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/05.
//

import UIKit

class DetailViewController: UIViewController {
    
    var tamagotchiDetail: Tamagotchi?

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
        
        backView.backgroundColor = .gray
        
        detailImageView.layer.cornerRadius = detailImageView.bounds.width / 2
        detailImageView.layer.masksToBounds = true
        
        detailImageView.image = tamagotchiDetail?.type.image
        
        detailNameLabel.text = tamagotchiDetail?.type.name
        detailContentsLabel.text = tamagotchiDetail?.type.contens
        
        
        cancelButton.titleLabel?.text = "취소"
        cancelButton.layer.borderWidth = 1
        selectButton.titleLabel?.text = "시작하기"
        selectButton.layer.borderWidth = 1
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    

}
