//
//  ViewController.swift
//  SwiftStaticUI
//
//  Created by Guanxiong Cao  on 19/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let mainScrollView = UIScrollView()
    
    let descriptionView = UIView()
    let titleLabel = UILabel()
    let addressLabel = UILabel()
    let availabelLabel = UILabel()
    let viewButton = UIButton(type: UIButtonType.system)
    let leftStackView = UIStackView()
    let rightStackView = UIStackView()
    let viewModel = ViewModel()
    var imageSize = CGSize()
    
    
    var headImageView: HeadView!
    
    // sizeClass相关
    var currentDeviceOrientation: UIDeviceOrientation = .unknown
    fileprivate var regularConstraints = [NSLayoutConstraint]()
    fileprivate var compactConstraints = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configMainScrollView()
    }
    
    func configMainScrollView() {
        
        
        view.addSubview(mainScrollView)
        
        
        
        headImageView = HeadView(image: UIImage(named: viewModel.imageName))
        
        
        
        mainScrollView.addSubview(headImageView)
        
        
        
        makeConstraints()
        
        
        
        // descripView
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(descriptionView)
        descriptionView.topAnchor.constraint(equalTo: headImageView.bottomAnchor, constant: 20).isActive = true
        descriptionView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 20).isActive = true
        
        let compactDescripTrail = descriptionView.trailingAnchor.constraint(equalTo: viewButton.leadingAnchor, constant: -20)
        let regularDesCripTrail = descriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        
        // label
        addressLabel.text = viewModel.address
        addressLabel.numberOfLines = 0
        
        addressLabel.font = UIFont.systemFont(ofSize: 12)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.addSubview(addressLabel)
        
        addressLabel.topAnchor.constraint(equalTo: descriptionView.topAnchor).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: descriptionView.leadingAnchor).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: descriptionView.trailingAnchor).isActive = true
        addressLabel.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor).isActive = true
        
        // button
        viewButton.setTitle(viewModel.buttonTitle, for: UIControlState.normal)
        viewButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        viewButton.setTitleColor(UIColor.blue, for: UIControlState.normal)
        viewButton.layer.borderColor = UIColor.blue.cgColor
        viewButton.layer.borderWidth = 1.0
        viewButton.layer.cornerRadius = 2.0
        viewButton.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(viewButton)

        viewButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        viewButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        let viewButtonLeading = viewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        let viewButtonTop = viewButton.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 20)
        let viewButtonTrail = viewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        let viewButtonBottom = viewButton.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor)
        
        if viewModel.stackViewContent.count > 0 {
            addStackView()
        } else {
            viewButton.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor, constant: -20).isActive = true
        }

        // 根据不同的屏幕添加两套约束方案到约束数组中
        compactConstraints.append(viewButtonBottom)
        compactConstraints.append(viewButtonTrail)
        compactConstraints.append(compactDescripTrail)
        
        regularConstraints.append(viewButtonTop)
        regularConstraints.append(viewButtonLeading)
        regularConstraints.append(regularDesCripTrail)
        }
    
    // 添加stackView
    func addStackView() {

        leftStackView.translatesAutoresizingMaskIntoConstraints = false
        rightStackView.translatesAutoresizingMaskIntoConstraints = false
        leftStackView.axis = .vertical
        rightStackView.axis = .vertical
        leftStackView.alignment = .leading
        rightStackView.alignment = .leading
        leftStackView.distribution = .equalSpacing
        rightStackView.distribution = .equalSpacing
        mainScrollView.addSubview(leftStackView)
        mainScrollView.addSubview(rightStackView)
        
        leftStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        leftStackView.topAnchor.constraint(equalTo: viewButton.bottomAnchor, constant: 20).isActive = true
        leftStackView.trailingAnchor.constraint(equalTo: rightStackView.leadingAnchor).isActive = true
        leftStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor, constant: -20).isActive = true
        leftStackView.widthAnchor.constraint(equalTo: rightStackView.widthAnchor).isActive = true
        rightStackView.leadingAnchor.constraint(equalTo: leftStackView.trailingAnchor).isActive = true
        rightStackView.topAnchor.constraint(equalTo: leftStackView.topAnchor).isActive = true
        rightStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        rightStackView.bottomAnchor.constraint(equalTo: leftStackView.bottomAnchor).isActive = true

        for (key, value) in viewModel.stackViewContent {
            let leftLabel = UILabel()
            leftLabel.text = key
            let rigthLabel = UILabel()
            rigthLabel.text = value
            leftStackView.addArrangedSubview(leftLabel)
            rightStackView.addArrangedSubview(rigthLabel)
        }
        
    }
    
    
    private func makeConstraints() {
        // scrollView
        // scrollView的contentSize由内部元素的高度决定
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        // imageView
        headImageView.translatesAutoresizingMaskIntoConstraints = false
        headImageView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor).isActive = true
        headImageView.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
        headImageView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor).isActive = true
        headImageView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor).isActive = true
        headImageView.heightAnchor.constraint(equalTo: mainScrollView.widthAnchor, multiplier: headImageView.ratio).isActive = true
    }
    
    // 监测屏幕旋转的方法
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        
        // 1.regular情形
        if traitCollection.horizontalSizeClass == .regular {
            // 使compact下的约束失效
            NSLayoutConstraint.deactivate(compactConstraints)
            // 使regular下的约束生效
            NSLayoutConstraint.activate(regularConstraints)
        } else {
            // 2.compact情形
            NSLayoutConstraint.deactivate(regularConstraints)
            NSLayoutConstraint.activate(compactConstraints)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
