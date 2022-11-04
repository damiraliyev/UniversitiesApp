//
//  MyUniversitiesViewController.swift
//  UniversitiesApp
//
//  Created by Damir Aliyev on 04.11.2022.
//

import Foundation
import UIKit
import SnapKit



class MyUniversitiesViewController: UIViewController {
    
    let tableView = UITableView()
    
    
    var universities =  [University]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
        layout()
        registerForNotifications()
    }
    
    func setup() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(goToNextVC))
        title = "My List"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 70
        tableView.register(MyUniversityCell.self, forCellReuseIdentifier: MyUniversityCell.reuseID)
    }
    
    
    func layout() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(addPressed), name: NSNotification.Name("AddUniversity"), object: nil)
    }
    
    @objc func addPressed(_ notification: Notification) {
        print("AAA")
        let universityNameInfo = notification.userInfo?["universityName"] as! String
        let universityWebPageInfo: [String] = [notification.userInfo?["webPage"] as! String]
        print(universityNameInfo)
        let newUniversity = University(domains: [""], name: universityNameInfo, webPages: universityWebPageInfo)
        
        universities.append(newUniversity)
        tableView.reloadData()
        print(universities.count)
    }
    
    @objc func goToNextVC() {
        let universitiesVC = ViewController()
        
        navigationController?.pushViewController(universitiesVC, animated: true)
    }
}

extension MyUniversitiesViewController: UITableViewDelegate {
    
}


extension MyUniversitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyUniversityCell.reuseID) as! MyUniversityCell
        cell.configureCell(model: universities[indexPath.row])
        
        return cell
    }
    
    
}



