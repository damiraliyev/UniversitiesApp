//
//  UniversityCell.swift
//  UniversitiesApp
//
//  Created by Damir Aliyev on 03.11.2022.
//

import Foundation
import UIKit
import SnapKit

struct Model {
    let universityName: String
    let webPage: String
}




class UniversityCell: UITableViewCell {
    static let reuseID = "UniversityCell"
    
    let stackView = makeStackView(axis: .vertical)
    
    let universityNameLabel = UILabel()
    
    let universityWebPage = UILabel()
    
    let addButton = UIButton()
    
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
//        registerForNotificationChanges()
        
    }
    
    func setup() {
        
//        universityNameLabel.adjustsFontSizeToFitWidth = true
        universityNameLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        
        universityWebPage.adjustsFontSizeToFitWidth = true
        universityWebPage.font = UIFont.systemFont(ofSize: 15, weight: .light)
        
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .primaryActionTriggered)
       
        
    }
    
    func layout() {
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(universityNameLabel)
        stackView.addArrangedSubview(universityWebPage)
        
        contentView.addSubview(addButton)
        
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.lessThanOrEqualTo(contentView.bounds.width - 20)
        }
        
        addButton.snp.makeConstraints { make in
            make.centerY.equalTo(stackView.snp.centerY)
            make.trailing.equalToSuperview().offset(-16)
            
        }
    }
    
    func registerForNotificationChanges() {
        
        let universityData = ["universityName" : universityNameLabel.text ?? "", "webPage": universityWebPage] as [String : Any]
        NotificationCenter.default.post(name: NSNotification.Name("AddUniversity"), object: nil, userInfo: universityData as [AnyHashable : Any])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(model: University) {
        universityNameLabel.text = model.name
        universityWebPage.text = model.webPages.first
    }
    
    @objc func addButtonPressed() {
        let universityData = ["universityName" : universityNameLabel.text ?? "", "webPage": universityWebPage.text] as [String : Any]
        NotificationCenter.default.post(name: NSNotification.Name("AddUniversity"), object: nil, userInfo: universityData as [AnyHashable : Any])
        print(universityData)
        addButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
    }
}
