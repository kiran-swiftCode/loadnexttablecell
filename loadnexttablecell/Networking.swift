//
//  Networking.swift
//  loadnexttablecell
//
//  Created by kiran on 1/7/19.
//  Copyright © 2019 kiran. All rights reserved.
//


import UIKit
import Alamofire

class NetworkingCall {
    
    let baseUrl = AppConstant.productUrl
    
    

    func getProductData(page: Int = 1) -> [TestModel]{
        
         var productDataa = [TestModel]()
        
        let parameters: [String: AnyObject] = ["category": "64" as AnyObject,
                                               "consumer_key": "ck_ae7125c511b7db39f52dfd633b742c748d09150e" as AnyObject,
                                               "consumer_secret": "cs_177eadbb770d4a1c6c486207aaec53fc53c48ac6" as AnyObject,
                                               "page": page as AnyObject]
        
        
        let req = Alamofire.request(baseUrl, method: .get, parameters: parameters)
        req.validate(statusCode: 200..<300)
        req.validate(contentType: ["application/json"])
        req.responseJSON { (response) in
            guard let data = response.result.value as? [[String: AnyObject]] else { return }
           print(data)
            for productDat in data {
                productDataa.append(TestModel(productJsonL: productDat as NSDictionary))
            }
            
        }
        return productDataa
}
    
    
}
