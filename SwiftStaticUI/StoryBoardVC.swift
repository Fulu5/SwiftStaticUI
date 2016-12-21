//
//  StoryBoardVC.swift
//  SwiftStaticUI
//
//  Created by Guanxiong Cao  on 21/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import UIKit

class StoryBoardVC: UIViewController {

    @IBOutlet weak var leftStack: UIStackView!
    @IBOutlet weak var rightStack: UIStackView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for view in leftStack.arrangedSubviews {
            
            let label = view as? UILabel
            label?.text = "hello"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 插入label给stackView管理
    @IBAction func AddLabelAction(_ sender: UIButton) {
        let label = UILabel()
        label.text = "New Added"
        leftStack.addArrangedSubview(label)
    }
    
    // 删除stackView上的label,同事从父视图删除
    @IBAction func DeleteLabelAction(_ sender: UIButton) {
        let label = leftStack.arrangedSubviews.last
        if let label = label {
            leftStack.removeArrangedSubview(label)
            label.removeFromSuperview()
        }
    }

}
