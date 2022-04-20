//
//  File.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 10.03.22.
//

import UIKit
import CloudKit

class WorkerCardView: UIViewController{
    
    //MARK: - init
    let button = UIButton()
    
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        view.addSubview(button)
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
    }
    
    
    
    //MARK: - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       setUpButton()
    }
    
    
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAnchorsForButton()
    }
}



//MARK: - setUpButton ext
extension WorkerCardView{
    func setUpButton(){
        self.button.setTitle("YES,go forward", for: .normal)
        self.button.layer.cornerRadius = 25
        //button.titleColor(for: .normal).
        self.button.backgroundColor = .brown
    }
    
    func setAnchorsForButton(){
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func pressButton(){
        self.dismiss(animated: true, completion: nil)
    }
}
