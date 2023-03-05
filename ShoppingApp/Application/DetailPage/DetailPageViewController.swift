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
        productDetailView.delegate = self
        setupUI()
    }
    
    private func setupUI() {
        productDetailView.frame = CGRect(x: 0, y: 0, width: scrollContainer.frame.width, height: scrollContainer.frame.height)
        scrollContainer.addSubview(productDetailView)
    }
}

// MARK: - ProductDetia Delegate

extension DetailPageViewController: ProductDetailViewDelegate {
    func cartUpdated() {
        navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - ViewController Data Source
extension DetailPageViewController: ViewControllerDataSource {
    func data(with model: BaseViewModel?) {
        guard let viewModel = model as? DetailPageViewModel else { return }
        productDetailView.configureView(product: viewModel.productData)
    }
}
