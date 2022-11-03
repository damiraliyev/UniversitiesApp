//
//  Factory.swift
//  UniversitiesApp
//
//  Created by Damir Aliyev on 03.11.2022.
//

import Foundation
import UIKit


func makeStackView(axis: NSLayoutConstraint.Axis) -> UIStackView {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = axis
    stackView.spacing = 5
    
    return stackView
}
