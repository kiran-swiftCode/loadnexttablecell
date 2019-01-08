//
//  TestModel.swift
//  loadnexttablecell
//
//  Created by kiran on 1/7/19.
//  Copyright © 2019 kiran. All rights reserved.
//

import Foundation

class TestModel {
    
    var title: String?
    var regularPrice: Int?
    var salePrice: Int?
    var productDescroption: String?
    var imageUrl: ImageUrl?
    
    init(productJsonL: NSDictionary) {
        self.title = productJsonL["name"] as? String
        self.regularPrice = productJsonL["regular_price"] as? Int
        self.salePrice = productJsonL["sale_price"] as? Int
        self.productDescroption = productJsonL["description"] as? String
        self.imageUrl = productJsonL["images"] as? ImageUrl
    }
    
    
    
}

class ImageUrl{
    
    var imageUrl: String?
    init(imageUrlJson: NSDictionary) {
        self.imageUrl = imageUrlJson["src"] as? String
    }
}
