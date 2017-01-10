//
//  LabelsView.swift
//  SwiftStaticUI
//
//  Created by Guanxiong Cao  on 23/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import UIKit

class LabelsView: UIView {

    var keyLabel = UILabel()
    var valueLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configSubViewsWith(item: (String, String)) {
        keyLabel.text = item.0
        keyLabel.textColor = UIColor.gray
        keyLabel.font = UIFont.systemFont(ofSize: 16)
        valueLabel.text = item.1
        valueLabel.font = UIFont.systemFont(ofSize: 16)
    }
    
    private func setupUI() {
        addSubview(keyLabel)
        addSubview(valueLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        setupKeylabelConstriants()
        setupValuelabelConstraints()
        
    }
    private func setupKeylabelConstriants() {
        keyLabel.translatesAutoresizingMaskIntoConstraints = false
        keyLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        keyLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        keyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
    private func setupValuelabelConstraints() {
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.leadingAnchor.constraint(equalTo: keyLabel.trailingAnchor).isActive = true
        valueLabel.topAnchor.constraint(equalTo: keyLabel.topAnchor).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        valueLabel.bottomAnchor.constraint(equalTo: keyLabel.bottomAnchor).isActive = true
        valueLabel.widthAnchor.constraint(equalTo: keyLabel.widthAnchor).isActive = true
    }
}
