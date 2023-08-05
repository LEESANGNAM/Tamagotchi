//
//  ViewController.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/04.
//

import UIKit

class SelectViewController: UIViewController {
     
    @IBOutlet weak var TamagotchiSelectCollectionView: UICollectionView!
    
    var tamagotchi: [Tamagotchi] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setCollectionView()
        self.title = "다마고치 선택하기"
        // Do any additional setup after loading the view.
    }
    func setData(){
        tamagotchi = [
            Tamagotchi(type: .ttakkeum),
            Tamagotchi(type: .bangsil),
            Tamagotchi(type: .banjjag),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none),
            Tamagotchi(type: .none)
        ]
    }

}

extension SelectViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tamagotchi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = TamagotchiSelectCollectionView.dequeueReusableCell(withReuseIdentifier: "TamagotchiCollectionViewCell", for: indexPath) as! TamagotchiCollectionViewCell
        
        cell.TamagotchiIamageView.image = tamagotchi[indexPath.row].type.image
        cell.TamagotchiNameLabel.text = tamagotchi[indexPath.row].name
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Detail", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        
        vc.tamagotchiDetail = tamagotchi[indexPath.row]
        vc.modalPresentationStyle = .overFullScreen
        
        present(vc, animated: true)
    }
    
    
    
    func findCell(){
        let nib = UINib(nibName: "TamagotchiCollectionViewCell", bundle: nil)
        TamagotchiSelectCollectionView.register(nib, forCellWithReuseIdentifier: "TamagotchiCollectionViewCell")
    }

    func setCollectionView(){
        TamagotchiSelectCollectionView.dataSource = self
        TamagotchiSelectCollectionView.delegate = self
        findCell()
        setCollectionViewLayout()
    }
        
    func setCollectionViewLayout(){
            let layout = UICollectionViewFlowLayout()
            let spacing: CGFloat = 10
            // 전체 너비 가져와서 빼기
            let width = UIScreen.main.bounds.width - (spacing * 5)
            let itemSize = width / 3
                
            
            layout.itemSize = CGSize(width: itemSize, height: itemSize)
            //컬렉션뷰 inset
            layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
            // 최소 간격
            layout.minimumLineSpacing = spacing
            layout.minimumInteritemSpacing = spacing
        
            TamagotchiSelectCollectionView.collectionViewLayout = layout
            
        }
    
}
