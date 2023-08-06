//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by 이상남 on 2023/08/06.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var settingTableView: UITableView!
    
    let settingCase = Setting.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setUpNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        settingTableView.reloadData()
    }
    
    func setUpNavigationBar(){
        navigationController?.navigationBar.topItem?.title = ""
        navigationItem.title = "설정"
              navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonTapped))
    }
    
    @objc func backButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
    
}



extension SettingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingCase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = settingTableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") as! SettingTableViewCell
        
        cell.setTableViewCell(settingCase: settingCase[indexPath.row])
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            print("이름변경창!")
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "SettingNameViewController") as? SettingNameViewController else { return }
            
            navigationController?.pushViewController(vc, animated: true)
            
        }else if indexPath.row == 1 {
            print("다마고치변경!")
        }else {
            print("초기화")
        }
    }
    
    
    
    func findCell(){
        let nib = UINib(nibName: "SettingTableViewCell", bundle: nil)
        settingTableView.register(nib, forCellReuseIdentifier: "SettingTableViewCell")
    }

    func setTableView(){
        settingTableView.dataSource = self
        settingTableView.delegate = self
        findCell()
        settingTableView.rowHeight = 50
    }
    
    
}
