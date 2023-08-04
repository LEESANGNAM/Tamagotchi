//
//  ViewController.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/04.
//

import UIKit

class SelectViewController: UIViewController {
     
    @IBOutlet weak var TamagotchiSelectCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
        
        self.title = "다마고치 선택하기"
        
        // Do any additional setup after loading the view.
    }


}

extension SelectViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = TamagotchiSelectCollectionView.dequeueReusableCell(withReuseIdentifier: "TamagotchiCollectionViewCell", for: indexPath) as! TamagotchiCollectionViewCell

        
        return cell
        
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
