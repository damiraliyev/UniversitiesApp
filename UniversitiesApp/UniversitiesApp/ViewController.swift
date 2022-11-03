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
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        layout()
        
        
        fetchAll()
        
    }
    
    func setup() {
        title = "Universities"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        
    
        
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
    
    func fetchAll() {
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


extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchController.searchBar.resignFirstResponder()
        
        fetchUniversities(country: searchBar.text) { result in
            switch result {
            case .success(let university):
                self.universities = university
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)

            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        fetchAll()
    }
}
