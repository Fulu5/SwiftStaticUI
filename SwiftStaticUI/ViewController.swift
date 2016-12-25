//
//  ViewController.swift
//  SwiftStaticUI
//
//  Created by Guanxiong Cao  on 19/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mainScrollView: UIScrollView!
    var headImageView: HeadView!
    var infoView: InfoView!
    var labelsStack: LabelsStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewModel = ViewModel()
        
        mainScrollView = UIScrollView()
        view.addSubview(mainScrollView)
        
        headImageView = HeadView(image: UIImage(named: viewModel.imageName))
        infoView = InfoView()
        labelsStack = LabelsStackView()
        
        infoView.setValueForSubViews(viewModel: viewModel)
        labelsStack.setValueForSubViews(viewModel: viewModel)
        
        mainScrollView.addSubview(headImageView)
        mainScrollView.addSubview(infoView)
        mainScrollView.addSubview(labelsStack)
        
        makeConstraints()
    }
    
    func makeConstraints() {
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
        // infoView
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 20).isActive = true
        infoView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor, constant: -20).isActive = true
        infoView.topAnchor.constraint(equalTo: headImageView.bottomAnchor, constant: 20).isActive = true
        // stackView
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        labelsStack.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 20).isActive = true
        labelsStack.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 20).isActive = true
        labelsStack.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor, constant: -20).isActive = true
        // 最底部的元素需要设定其与mainScrollView底部的约束
        // 以此来撑大scrollView的contentSize
        labelsStack.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor).isActive = true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}
