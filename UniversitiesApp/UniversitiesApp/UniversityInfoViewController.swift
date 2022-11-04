//
//  UniversityInfoViewController.swift
//  UniversitiesApp
//
//  Created by Damir Aliyev on 04.11.2022.
//

import Foundation
import UIKit
import SnapKit

class UniversityInfoViewController: UIViewController {
    
    let universityNameLabel = UILabel()
    let domainLabel = UILabel()
    let countryLabel = UILabel()
    
    let prefixDomain = UILabel()
    let prefixCountry = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setup()
        layout()
    }
    
    func setup() {
        universityNameLabel.font = UIFont.systemFont(ofSize: 30,weight: .medium)
        universityNameLabel.numberOfLines = 0
        universityNameLabel.textAlignment = .center
        universityNameLabel.text = "Suleyman Demirel University"
        
        domainLabel.font = UIFont.systemFont(ofSize: 18)
        domainLabel.text = "sdu.edu.kz"
        
        countryLabel.font = UIFont.systemFont(ofSize: 18)
        countryLabel.text = "Kazakhstan"
        
        prefixDomain.font = UIFont.systemFont(ofSize: 18)
        prefixDomain.text = "Domain: "
        prefixCountry.font = UIFont.systemFont(ofSize: 18)
        prefixCountry.text = "Country: "
    }
    
    func layout() {
        
        view.addSubview(universityNameLabel)
        view.addSubview(domainLabel)
        view.addSubview(countryLabel)
        
        view.addSubview(prefixDomain)
        view.addSubview(prefixCountry)
        universityNameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.width.equalTo(view.bounds.width - 20)
        }
        
        prefixDomain.snp.makeConstraints { make in
            make.top.equalTo(universityNameLabel.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(16)
        }
        
        domainLabel.snp.makeConstraints { make in
            make.top.equalTo(prefixDomain.snp.top)
            make.leading.equalTo(prefixDomain.snp.trailing).offset(8)
            
        }
        
        prefixCountry.snp.makeConstraints { make in
            make.top.equalTo(domainLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
        }

        countryLabel.snp.makeConstraints { make in
            make.top.equalTo(prefixCountry.snp.top)
            make.leading.equalTo(prefixDomain.snp.trailing).offset(8)
        }

    }
    
    
}
