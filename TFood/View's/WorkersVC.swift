//
//  NewVC.swift
//  TFood
//
//  Created by Vladislav Tuleiko on 15.03.22.
//

import UIKit

class WorkersVC: UIViewController {
    
    //MARK: - Declaration
    var workersTableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
    lazy var workerInfoVC = WorkerCardView()
    var safeArea: UILayoutGuide!
    
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        view.backgroundColor = .black
        view.addSubview(workersTableView)
        self.navigationItem.title = "Workers"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        workersTableView.dataSource = self
        workersTableView.delegate = self
        workersTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
            }
    
    
    
    //MARK: - viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    
    //MARK: - viewDidLayotSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        workersTableView.frame = view.bounds
    }
}



//MARK: - setUpFnc's ext's
extension WorkersVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = workersTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        setUpTableViewCell(cell: cell)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if workerInfoVC.sheetPresentationController != nil{
            workerInfoVC.sheetPresentationController?.detents = [.medium()]
            workerInfoVC.sheetPresentationController?.prefersGrabberVisible = true
            workerInfoVC.sheetPresentationController?.preferredCornerRadius = 25
        }
        present(workerInfoVC, animated: true, completion: nil)
    }
}

extension WorkersVC{

    
    func setUpTableViewCell(cell: UITableViewCell){
        cell.textLabel?.text = "Dan"
        cell.backgroundColor = .lightGray
        cell.layer.cornerRadius = 25
    }
}
