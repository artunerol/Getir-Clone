//
//  DetailPageViewController.swift
//  ShoppingApp
//
//  Created by Artun Erol on 28.02.2023.
//

import UIKit

class DetailPageViewController: BaseViewController {
    private var viewModel: DetailPageViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelConfigurator = self
        
    }
}

// MARK: - ViewModel Configurator
extension DetailPageViewController: ViewModelConfigurator {
    func viewModelInfo(model: BaseViewModel?) {
        guard let viewModel = model as? DetailPageViewModel else { return }
        self.viewModel = viewModel
    }
}
