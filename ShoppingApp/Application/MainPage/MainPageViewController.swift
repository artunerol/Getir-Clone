//
//  ViewController.swift
//  ShoppingApp
//
//  Created by Erdem Perşembe on 12.04.2022.
//

import UIKit

class MainPageViewController: BaseViewController {
    @IBOutlet var productsCollectionView: UICollectionView! {
        didSet {
            productsCollectionView.delegate = self
            productsCollectionView.dataSource = self
            productsCollectionView.register(UINib(nibName: "ProductsCollectionViewCell",
                                                  bundle: nil),
                                            forCellWithReuseIdentifier: ProductsCollectionViewCell.reuseIdentifier)
            productsCollectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 8, right: 16)
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        NavigationRouter.navigate(fromViewController: self,
                                  destinationViewController: .detailPage,
                                  transitionStlye: .fullScreenWithNavigation)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
}

// MARK: - CollectionView Delegate & DataSource

extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.reuseIdentifier,
                                                            for: indexPath) as! ProductsCollectionViewCell
        cell.configureCell(with: .init(imagePath: "", productPrice: 0, productName: "Product"))
        return cell
    }
}

// MARK: - CollectionViewDelegateFlowLayout

extension MainPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (collectionView.frame.width / 2) - 50
        return CGSize(width: itemWidth, height: 160)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
