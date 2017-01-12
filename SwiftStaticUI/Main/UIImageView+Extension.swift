//
//  UIImageView+Extension.swift
//  SwiftStaticUI
//
//  Created by Guanxiong Cao  on 12/01/2017.
//  Copyright © 2017 Guanxiong Cao . All rights reserved.
//

import UIKit

extension UIImageView {
    var ratio: CGFloat {
        guard let image = image else {
            return 1.0
        }
        return image.size.height / image.size.width
    }
}
