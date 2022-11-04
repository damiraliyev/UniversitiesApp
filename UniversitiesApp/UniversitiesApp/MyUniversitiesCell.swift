//
//  MyUniversitiesCell.swift
//  UniversitiesApp
//
//  Created by Damir Aliyev on 04.11.2022.
//
import Foundation
import UIKit
import SnapKit

class MyUniversityCell: UITableViewCell {
    
    static let reuseID = "MyUniversityCell"
    
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
//            make.width.lessThanOrEqualTo(contentView.bounds.width - 20)
        }
        
        universityNameLabel.snp.makeConstraints { make in
            make.width.lessThanOrEqualTo(contentView.bounds.width - 20)
        }
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(model: University) {
        universityNameLabel.text = model.name
        universityWebPage.text = model.webPages.first
    }
}

