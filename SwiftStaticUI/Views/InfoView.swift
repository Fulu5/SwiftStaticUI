//
//  InfoView.swift
//  SwiftStaticUI
//
//  Created by Guanxiong Cao  on 23/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import UIKit

class InfoView: UIView {
    var nameLabel: UILabel!
    var addressLabel: UILabel!
    var viewButton: UIButton!
    
    var compactConstraints = [NSLayoutConstraint]()
    var regularConstraints = [NSLayoutConstraint]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nameLabel = createNameLabel()
        addressLabel = createAddressLabel()
        viewButton = createDetailButton()
        
        addSubview(nameLabel)
        addSubview(addressLabel)
        addSubview(viewButton)
        
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setValueForSubViews(viewModel: ViewModel) {
        nameLabel.text = viewModel.name
        addressLabel.text = viewModel.address
        viewButton.setTitle(viewModel.buttonTitle, for: .normal)
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
    
    func setUpConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        
        viewButton.translatesAutoresizingMaskIntoConstraints = false
        viewButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        compactConstraints.append(nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor))
        compactConstraints.append(addressLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor))
        compactConstraints.append(viewButton.leadingAnchor.constraint(equalTo: self.leadingAnchor))
        compactConstraints.append(viewButton.leadingAnchor.constraint(equalTo: self.leadingAnchor))
        compactConstraints.append(viewButton.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 20))
        compactConstraints.append(viewButton.bottomAnchor.constraint(equalTo: self.bottomAnchor))
        
        regularConstraints.append(nameLabel.trailingAnchor.constraint(equalTo: viewButton.leadingAnchor))
        regularConstraints.append(addressLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor))
        regularConstraints.append(addressLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor))
        regularConstraints.append(viewButton.topAnchor.constraint(equalTo: self.topAnchor))
        regularConstraints.append(viewButton.widthAnchor.constraint(equalToConstant: 150))
    }
    
    func createNameLabel() -> UILabel {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        return nameLabel
    }
    
    func createAddressLabel() -> UILabel {
        let addressLabel = UILabel()
        addressLabel.font = UIFont.systemFont(ofSize: 16)
        addressLabel.numberOfLines = 0
        return addressLabel
    }
    
    func createDetailButton() -> UIButton {
        let detailButton = UIButton()
        detailButton.setTitleColor(UIColor.blue, for: .normal)
        detailButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        detailButton.layer.borderWidth = 1.0
        detailButton.layer.borderColor = UIColor.blue.cgColor
        detailButton.layer.cornerRadius = 3.0
        detailButton.contentEdgeInsets = UIEdgeInsetsMake(12.0, 20.0, 12.0, 20.0)
        return detailButton
    }
}
