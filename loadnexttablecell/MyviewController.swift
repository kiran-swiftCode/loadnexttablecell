//
//  MyviewController.swift
//  loadnexttablecell
//
//  Created by kiran on 1/7/19.
//  Copyright © 2019 kiran. All rights reserved.
//

import UIKit

class MyviewController: UIViewController {
    
    let newNetwork = NetworkingCall()
    var currentPage = 1
    
    var productArray = [TestModel]()
    @IBOutlet weak var productCollectionVC: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productCollectionVC.dataSource = self
        productCollectionVC.delegate = self
        productArray = newNetwork.getProductData()

    }
    
    
    @IBAction func reloadCV(_ sender: Any) {
        productCollectionVC.reloadData()
    }
    
}

extension MyviewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productCollectionVC.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? testCollectionviewCell
        cell?.pTitle.text = "hgjhgj"
        return cell!
    }
    
    
}
