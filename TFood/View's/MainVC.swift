//
//  ViewController.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 9.03.22.
//

import UIKit

    

class MainVC: UITabBarController {
   
    
    
    //MARK: - Declaration
    let homeVC = HomeVC()
    let workersVC = WorkersVC()
    let catalogVC = CatalogVC()
    let settingsVC = SettingsVC()
    
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .white
        self.setViewControllers([homeVC, workersVC, catalogVC, settingsVC], animated: true)
        
    }
    
    
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpTabBarItems()
    }
    
    
    
    //MARK: - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
}



//MARK: - setUpFnc's ext
extension MainVC{
    func setUpTabBarItems(){
        tabBar.backgroundColor = .white
        tabBar.tintColor = .darkGray
        tabBar.isTranslucent = true
        homeVC.title = "Home"
        workersVC.title = "Workers"
        catalogVC.title = "Catalog"
        settingsVC.title = "Settings"
        if let items = tabBar.items{
           let images = ["house", "star", "star", "house"]
            for x in 0...3{
                items[x].image = UIImage(systemName: images[x])
                
            }
        }else{
            print("Items not found")
        }
    }
    
}

