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
    var headeImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configMainScrollView()
        
    }
    
    func configMainScrollView() {
        mainScrollView = UIScrollView()
        mainScrollView.backgroundColor = UIColor.gray
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainScrollView)
        
        mainScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainScrollView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

