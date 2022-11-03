//
//  ViewController.swift
//  UniversitiesApp
//
//  Created by Damir Aliyev on 03.11.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    let tableView = UITableView()
    
    var universities =  [University]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
        
        
        
        fetchUniversities() { result in
            switch result {
            case .success(let university):
                self.universities = university
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)

            }
        }
        
    }
    
    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 65
        tableView.register(UniversityCell.self, forCellReuseIdentifier: UniversityCell.reuseID)
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


}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UniversityCell.reuseID) as! UniversityCell
        cell.configureCell(model: universities[indexPath.row])
        return cell
    }
    
    
}

