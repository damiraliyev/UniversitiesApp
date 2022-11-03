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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
        
    }
    
    func setup() {
        
        universityNameLabel.adjustsFontSizeToFitWidth = true
        universityNameLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        
        universityWebPage.adjustsFontSizeToFitWidth = true
        universityWebPage.font = UIFont.systemFont(ofSize: 15, weight: .light)
    }
    
    func layout() {
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(universityNameLabel)
        stackView.addArrangedSubview(universityWebPage)
        
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(model: University) {
        universityNameLabel.text = model.country
        universityWebPage.text = model.webPages.first
    }
}
