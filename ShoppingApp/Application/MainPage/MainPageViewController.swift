//
//  ViewController.swift
//  ShoppingApp
//
//  Created by Erdem Perşembe on 12.04.2022.
//

import UIKit

class MainPageViewController: BaseViewController {
    private let viewModel = MainPageViewModel()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchProductListArray { [weak self] productListArray in
            guard let self = self else { return }
            self.viewModel.productListArray = productListArray
            
            DispatchQueue.main.async {
                self.productsCollectionView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setCartNavigationButton()
    }
    
    private func setCartNavigationButton() {
        let customCartButton: ShoppingCartNavigationButton = UIView.fromNib()
        customCartButton.configureUI()
        customCartButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: customCartButton)
    }
    
    @objc private func cartButtonTapped() {
        let productsInCart = UserdefaultsStore.get(type: [Product].self, key: UserDefaultsKeys.productsInCart)
        
        if productsInCart != nil && !(productsInCart?.isEmpty ?? false) {
            NavigationRouter.navigate(fromViewController: self, destinationViewController: .shoppingCart, transitionStlye: .fullScreenWithNavigation)
        } else {
            configureAlert()
        }
    }
}

// MARK: - Helpers

extension MainPageViewController {
    private func configureAlert() {
        let alertViewController = UIAlertController(title: "Oops!",
                                                    message: "Shopping Cart is Empty",
                                                    preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        self.present(alertViewController, animated: true)
    }
}

// MARK: - CollectionView Delegate & DataSource

extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.productListArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.reuseIdentifier,
                                                            for: indexPath) as? ProductsCollectionViewCell else { return UICollectionViewCell() }
        let product = viewModel.productListArray[indexPath.row]
        cell.configureCell(with: product)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productAtIndexPath = Product(productName: viewModel.productListArray[indexPath.row].productName,
                                         productDescription: viewModel.productListArray[indexPath.row].productDescription,
                                         productPrice: viewModel.productListArray[indexPath.row].productPrice,
                                         productImage: viewModel.productListArray[indexPath.row].productImage)
        
        NavigationRouter.navigate(fromViewController: self,
                                  destinationViewController: .detailPage,
                                  destinationViewModel: DetailPageViewModel(data: productAtIndexPath),
                                  transitionStlye: .fullScreenWithNavigation)
    }
}

// MARK: - CollectionViewDelegateFlowLayout

extension MainPageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (collectionView.frame.width / 2) - 50
        return CGSize(width: itemWidth, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
