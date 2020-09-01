//
//  Article.swift
//  ReadApi
//
//  Created by Tao Trong Nghia on 8/31/20.
//  Copyright © 2020 Tao Trong Nghia. All rights reserved.
//

import Foundation

struct Data : Codable{
    var data : [Location]
}
struct Location : Codable {
    let userName : String
    let age : Int
    let gender : String
    let location : String
    let image : String
    
}

