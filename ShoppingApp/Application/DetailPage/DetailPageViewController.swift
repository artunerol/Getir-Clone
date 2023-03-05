//
//  DetailPageViewController.swift
//  ShoppingApp
//
//  Created by Artun Erol on 28.02.2023.
//

import UIKit

class DetailPageViewController: BaseViewController {
    
    @IBOutlet var scrollContainer: UIView!
    
    private var viewModel: DetailPageViewModel?
    private let productDetailView: ProductDetailView =  UIView.fromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        scrollContainer.addSubview(productDetailView)
    }
}

// MARK: - ViewModel Configurator
extension DetailPageViewController: ViewControllerDataSource {
    func data(with model: BaseViewModel?) {
        guard let viewModel = model as? DetailPageViewModel else { return }
        productDetailView.configureView(product: viewModel.productData)
    }
}
