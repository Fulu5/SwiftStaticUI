//
//  InfoView.swift
//  SwiftStaticUI
//
//  Created by Guanxiong Cao  on 23/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import UIKit

class InfoView: UIView {
    
    var nameLabel = UILabel()
    var addressLabel = UILabel()
    var viewButton = UIButton()
    
    var compactConstraints = [NSLayoutConstraint]()
    var regularConstraints = [NSLayoutConstraint]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubViews()
        addAllSubViews()
        setUpConstraints()
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.horizontalSizeClass == .compact {
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.activate(compactConstraints)
        } else {
            NSLayoutConstraint.deactivate(compactConstraints)
            NSLayoutConstraint.activate(regularConstraints)
        }
    }
    func configSubViewsWith(viewModel: ViewModel) {
        nameLabel.text = viewModel.name
        addressLabel.text = viewModel.address
        viewButton.setTitle(viewModel.buttonTitle, for: .normal)
    }
    private func addAllSubViews() {
        addSubview(nameLabel)
        addSubview(addressLabel)
        addSubview(viewButton)
    }
    
    private func setupSubViews() {
        setupNameLabel()
        setupAddressLabel()
        setupDetailButton()
    }
    
    private func setUpConstraints() {
        setupNameLabelConstraints()
        setupAddressLabelConstraints()
        setupViewButtonConstraints()
        setupCompactConstraints()
        setupRegularConstraints()
    }
    private func setupNameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    private func setupAddressLabelConstraints() {
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
    }
    private func setupViewButtonConstraints() {
        viewButton.translatesAutoresizingMaskIntoConstraints = false
        viewButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    private func setupCompactConstraints() {
        compactConstraints.append(nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor))
        compactConstraints.append(addressLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor))
        compactConstraints.append(viewButton.leadingAnchor.constraint(equalTo: self.leadingAnchor))
        compactConstraints.append(viewButton.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 20))
        compactConstraints.append(viewButton.bottomAnchor.constraint(equalTo: self.bottomAnchor))
    }
    private func setupRegularConstraints() {
        regularConstraints.append(nameLabel.trailingAnchor.constraint(equalTo: viewButton.leadingAnchor))
        regularConstraints.append(addressLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor))
        regularConstraints.append(addressLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor))
        regularConstraints.append(viewButton.topAnchor.constraint(equalTo: self.topAnchor))
        regularConstraints.append(viewButton.widthAnchor.constraint(equalToConstant: 150))
    }
    private func setupNameLabel() {
        nameLabel.font = UIFont.systemFont(ofSize: 20)
    }
    
    private func setupAddressLabel() {
        addressLabel = UILabel()
        addressLabel.font = UIFont.systemFont(ofSize: 16)
        addressLabel.numberOfLines = 0
    }
    private func setupDetailButton() {
        viewButton = UIButton()
        viewButton.setTitleColor(UIColor.blue, for: .normal)
        viewButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        viewButton.layer.borderWidth = 1.0
        viewButton.layer.borderColor = UIColor.blue.cgColor
        viewButton.layer.cornerRadius = 3.0
        viewButton.contentEdgeInsets = UIEdgeInsetsMake(12.0, 20.0, 12.0, 20.0)
    }
}
