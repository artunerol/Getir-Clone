//
//  ShoppingCartViewController.swift
//  ShoppingApp
//
//  Created by Artun Erol on 28.02.2023.
//

import UIKit

class ShoppingCartViewController: BaseViewController {
    private let viewModel = ShoppingCartViewModel()
    
    @IBOutlet var productsTableView: UITableView! {
        didSet {
            productsTableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: CartTableViewCell.identifier)
            productsTableView.delegate = self
            productsTableView.dataSource = self
            productsTableView.allowsSelection = false
        }
    }
    
    @IBOutlet var checkoutButtonOutlet: UIButton! {
        didSet {
            checkoutButtonOutlet.layer.cornerRadius = 8
        }
    }
    
    @IBAction func checkoutButtonPressed(_ sender: Any) {
        showAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productsTableView.reloadData()
    }
}

// MARK: - TableView Delegate & Data Source

extension ShoppingCartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.productCountPairArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as? CartTableViewCell else { return UITableViewCell() }
        let productCountPair = viewModel.productCountPairArray[indexPath.row].first
        cell.configure(product: productCountPair?.key ?? Product(), count: productCountPair?.value ?? 0)
        return cell
    }
}

// MARK: - Helpers

extension ShoppingCartViewController {
    private func showAlert() {
        let alertViewController = UIAlertController(title: "Success",
                                                    message: "Checkout Completed with \(viewModel.products.count) products.",
                                                    preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok",
                                        style: .cancel) { [weak self] _ in
            UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.productsInCart)
            self?.navigationController?.popToRootViewController(animated: true)
        }
        
        alertViewController.addAction(alertAction)
        self.present(alertViewController, animated: true)
    }
}
