//
//  LabelsStackView.swift
//  SwiftStaticUI
//
//  Created by Guanxiong Cao  on 23/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import UIKit

class LabelsStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .vertical
        distribution = .equalSpacing
        spacing = 5
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setValueForSubViews(viewModel: ViewModel) {
        for item in viewModel.stackViewContent {
            let labelsView = LabelsView()
            labelsView.setValueForSubViews(item: item)
            addArrangedSubview(labelsView)
        }
    }
}
