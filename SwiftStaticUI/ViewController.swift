//
//  ViewController.swift
//  SwiftStaticUI
//
//  Created by Guanxiong Cao  on 19/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configMainScrollView()
        
    }
    
    func configMainScrollView() {
        let mainScrollView = UIScrollView()
        mainScrollView.contentSize = CGSize(width: view.frame.size.width, height: 1000)
        mainScrollView.backgroundColor = UIColor.lightGray
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainScrollView)
        
        mainScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainScrollView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
        let headeImageView = UIImageView()
        headeImageView.translatesAutoresizingMaskIntoConstraints = false
        headeImageView.image = UIImage.init(named: "head")
        mainScrollView.addSubview(headeImageView)
        
        headeImageView.topAnchor.constraint(equalTo: mainScrollView.topAnchor).isActive = true
        headeImageView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor).isActive = true
        headeImageView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor).isActive = true
        headeImageView.heightAnchor.constraint(equalTo: mainScrollView.heightAnchor, multiplier: 0.5).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

