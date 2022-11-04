//
//  MyUniversitiesViewController.swift
//  UniversitiesApp
//
//  Created by Damir Aliyev on 04.11.2022.
//

import Foundation
import UIKit
import SnapKit


var addedUnivers = [String]()

class MyUniversitiesViewController: UIViewController {
    
    let tableView = UITableView()
    
    
    var universities =  [University]()
    
//    var addedUnivers = [String]()
    
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
        let countryInfo = notification.userInfo?["country"] as! String
        let domainInfo = notification.userInfo?["domain"] as! String
        
        let newUniversity = University(domains: [domainInfo], name: universityNameInfo, webPages: universityWebPageInfo, country: countryInfo)
        
        if !addedUnivers.contains(universityNameInfo) {
            universities.append(newUniversity)
            addedUnivers.append(universityNameInfo)
            tableView.reloadData()
        }
        
        print(universities.count)
    }
    
    @objc func goToNextVC() {
        let universitiesVC = AllUniversitesViewController()
        
        navigationController?.pushViewController(universitiesVC, animated: true)
    }
}

extension MyUniversitiesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let universityInfoVC = UniversityInfoViewController()
        universityInfoVC.viewDidLoad()
        print(universities[indexPath.row])
        universityInfoVC.universityNameLabel.text = universities[indexPath.row].name
        universityInfoVC.domainLabel.text = universities[indexPath.row].domains[0]
        universityInfoVC.countryLabel.text = universities[indexPath.row].country
        
        navigationController?.pushViewController(universityInfoVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            universities.remove(at: indexPath.row)
            tableView.reloadData()
            addedUnivers.remove(at: indexPath.row)
        }
    }
    
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



