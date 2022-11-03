//
//  SkeletonCell.swift
//  UniversitiesApp
//
//  Created by Damir Aliyev on 04.11.2022.
//

import Foundation
import UIKit
import SnapKit
class SkeletonCell: UITableViewCell {
    static let reuseID = "SkeletonCell"
    
    let stackView = makeStackView(axis: .vertical)
    
    let universityNameLabel = UILabel()
    
    let universityWebPage = UILabel()
    
    // Gradients
        let nameLayer = CAGradientLayer()
        let webPageLayer = CAGradientLayer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupLayers()
        setupAnimation()
        layout()
        
    }
    
    func setup() {
        
        universityNameLabel.adjustsFontSizeToFitWidth = true
        universityNameLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        universityNameLabel.text = "------------------------"
        
        universityWebPage.adjustsFontSizeToFitWidth = true
        universityWebPage.font = UIFont.systemFont(ofSize: 15, weight: .light)
        universityWebPage.text = "----------"
        
        
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
    
    private func setupLayers() {
       
        
        nameLayer.startPoint = CGPoint(x: 0, y: 0.5)
        nameLayer.endPoint = CGPoint(x: 1, y: 0.5)
        universityNameLabel.layer.addSublayer(nameLayer)
        
        
        webPageLayer.startPoint = CGPoint(x: 0, y: 0.5)
        webPageLayer.endPoint = CGPoint(x: 1, y: 0.5)
        universityWebPage.layer.addSublayer(webPageLayer)
       
        }
    
    
     private func setupAnimation() {
         let webPageGroup = makeAnimationGroup()
         webPageGroup.beginTime = 0.0
         webPageLayer.add(webPageGroup, forKey: "backgroundColor")
         
         let nameGroup = makeAnimationGroup(previousGroup: webPageGroup)
         nameLayer.add(nameGroup, forKey: "backgroundColor")
         
        
     }
     
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLayer.frame = universityNameLabel.bounds
        nameLayer.cornerRadius = universityNameLabel.bounds.height/2
        
        webPageLayer.frame = universityWebPage.bounds
        webPageLayer.cornerRadius = universityWebPage.bounds.height/2
        
        
        
    }
}


extension SkeletonCell: SkeletonLoadable {
    
}
