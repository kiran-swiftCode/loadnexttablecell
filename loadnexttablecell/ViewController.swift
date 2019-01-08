//
//  ViewController.swift
//  loadnexttablecell
//
//  Created by kiran on 1/7/19.
//  Copyright © 2019 kiran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let newNet = NetworkingCall()
    
    let  refreshControl = UIRefreshControl()


    private var currentPage = 1
    private var shouldShowLoadingCell = false
    var productDataArray = [TestModel]()

    @IBOutlet weak var testCVC: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        testCVC.delegate = self
        testCVC.dataSource = self
        refreshControl.addTarget(self, action: #selector(refreshProducts), for: .valueChanged)
        refreshControl.beginRefreshing()
        loadProducts()

    }


    @objc private func refreshProducts(){
        currentPage = 1
        loadProducts(refresh: true)
    }


    private func loadProducts(refresh: Bool = false) {
        print("Fetching page \(currentPage)")
        newNet.getProductData(page: currentPage) { (page) in
            if refresh {
                self.productDataArray = page.data
            } else {
                for product in page.data {
                    if !self.productDataArray.contains(where: { (product) -> Bool in
                        return true
                    }) {
                        self.productDataArray.append(product)

                    }
                }
            }

            self.shouldShowLoadingCell = page.currentPage < page.numberOfPages
            self.refreshControl.endRefreshing()
            self.testCVC.reloadData()


        }


    }
    private func fetchNextPage() {
        currentPage += 1
        loadProducts()
    }



}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = productDataArray.count
        return shouldShowLoadingCell ? count + 1 : count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = testCVC.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? testCollectionviewCell
        cell?.pTitle.text = productDataArray[indexPath.row].title
        return cell!
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
                guard isLoadingIndexPath(indexPath) else { return }
                fetchNextPage()

    }

    private func isLoadingIndexPath(_ indexPath: IndexPath) -> Bool {
        guard shouldShowLoadingCell else { return false }
        return indexPath.row == self.productDataArray.count
    }





}

