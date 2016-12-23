//
//  HeadView.swift
//  SwiftStaticUI
//
//  Created by Guanxiong Cao  on 23/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import UIKit

class HeadView: UIImageView {

    var headView: UIImageView!
    let viewModel = ViewModel()
    var ratio: CGFloat {
        return self.image!.size.height / self.image!.size.width
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        self.image = image ?? UIImage(named: "dog")
//        self.clipsToBounds = true
        contentMode = .scaleAspectFill
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
