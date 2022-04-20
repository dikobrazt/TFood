//
//  SettingsVC.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 15.03.22.
//

import UIKit
import FirebaseAuth

class SettingsVC: UIViewController {
    
    //MARK: - Declaration
    let logOutBtn = UIButton()
    //let profileImage = UIImage(systemName: "Home")
    let nameLabel = UILabel()
    let secondNameLabel = UILabel()
    let ageLabel = UILabel()
    let workPositionLabel = UILabel()
    
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        view.backgroundColor = .white
        view.addSubview(logOutBtn)
        view.addSubview(nameLabel)
        view.addSubview(secondNameLabel)
        view.addSubview(ageLabel)
        view.addSubview(workPositionLabel)
        logOutBtn.addTarget(self, action: #selector(pressLogOutBtn), for: .touchUpInside)
        
    }
    
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
     setUpLogOutBtn()
        setUpLabels()
    }
    
    
    //MARK: - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        logOutBtn.frame = .init(x:260, y:65, width: 100, height: 50)
        nameLabel.frame = .init(x: 120, y: 200, width: 100, height: 30)
        secondNameLabel.frame = .init(x: 120, y: 225, width: 100, height: 30)
        ageLabel.frame = .init(x: 120, y: 250, width: 100, height: 30)
        workPositionLabel.frame = .init(x: 120, y: 275, width: 100, height: 30)
    }
}



//MARK: - setUpFnc's ext
extension SettingsVC{
    func setUpLogOutBtn(){
        logOutBtn.setTitle("LogOut", for: .normal)
        logOutBtn.backgroundColor = .black
        logOutBtn.layer.cornerRadius = 25
        logOutBtn.setTitleColor(.white, for: .normal)
        logOutBtn.setTitleColor(.systemRed, for: .highlighted)
        logOutBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    func setUpLabels(){
        nameLabel.text = "Vlad"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        secondNameLabel.text = "Tuleiko"
        secondNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        ageLabel.text = "19 y.o."
        ageLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        workPositionLabel.text = "IOS Dev"
        workPositionLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    @objc func pressLogOutBtn(){
        let mainVC = MainVC()
        do{
            try Auth.auth().signOut()
        }catch{
            print("Suuuck")
            print(error)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
