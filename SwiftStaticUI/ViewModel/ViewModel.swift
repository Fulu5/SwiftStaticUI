//
//  ViewModel.swift
//  SwiftStaticUI
//
//  Created by Guanxiong Cao  on 21/12/2016.
//  Copyright © 2016 Guanxiong Cao . All rights reserved.
//

import Foundation

struct ViewModel {
    
    var imageName: String {
        return "dog"
    }
    
    var name: String {
        return "Name"
    }
    
    var address: String {
        return "Multiple lines address. Multiple lines address. Multiple lines address. Multiple lines address. Multiple lines address"
    }
    
    var buttonTitle: String {
        return "Click"
    }
    
    var stackViewContent: Array<(String, String)> {
        return [
            ("key1", "value1"),
            ("key2", "value2"),
            ("key3", ""),
            ("key4", "value4")
            ].filter({key, value -> Bool in
                return !value.isEmpty
            })
    }
}
