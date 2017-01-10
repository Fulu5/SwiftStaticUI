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
    var headImageView: UIImageView!
    var infoView = InfoView()
    var labelsStack = LabelsStackView()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData() {
            [weak self] viewModel in
            guard let strongSelf = self else {
                return
            }
            strongSelf.configSubViewsWith(viewModel)
            strongSelf.addSubViews()
            strongSelf.setupSubViewsConstraints()
        }
    }
    private func fetchData(completion: ((_ viewModel: ViewModel) -> Void)) {
        completion(ViewModel())
    }
    private func configSubViewsWith(_ viewModel: ViewModel) {
        
        headImageView = HeadView(image: UIImage(named: viewModel.imageName))
        infoView.configSubViewsWith(viewModel: viewModel)
        labelsStack.configSubViewsWith(viewModel: viewModel)
    }
    
    private func addSubViews() {
        
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(headImageView)
        mainScrollView.addSubview(infoView)
        mainScrollView.addSubview(labelsStack)

    }
    private func setupSubViewsConstraints() {
        
        setupMainScrollViewConstraints()
        setupHeadImageViewConstraints()
        setupInfoViewConstraints()
        setupLabelsStackView()
    }
    
    private func setupMainScrollViewConstraints() {
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    private func setupHeadImageViewConstraints() {
        headImageView.translatesAutoresizingMaskIntoConstraints = false
        headImageView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor).isActive = true
        headImageView.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
        headImageView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor).isActive = true
        headImageView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor).isActive = true
        headImageView.heightAnchor.constraint(equalTo: mainScrollView.widthAnchor, multiplier: headImageView.ratio).isActive = true
    }
    
    private func setupInfoViewConstraints() {
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 20).isActive = true
        infoView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor, constant: -20).isActive = true
        infoView.topAnchor.constraint(equalTo: headImageView.bottomAnchor, constant: 20).isActive = true
    }
    private func setupLabelsStackView() {
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        labelsStack.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor, constant: 20).isActive = true
        labelsStack.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 20).isActive = true
        labelsStack.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor, constant: -20).isActive = true
        labelsStack.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor).isActive = true
    }
}

extension UIImageView {
    fileprivate var ratio: CGFloat {
        guard let image = image else {
            return 1.0
        }
        return image.size.height / image.size.width
    }
}
