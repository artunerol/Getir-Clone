//
//  BaseViewController.swift
//  ShoppingApp
//
//  Created by Artun Erol on 1.03.2023.
//

import UIKit

class BaseViewController: UIViewController {
    var dataSource: ViewControllerDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationControllerUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func setCustomNavigationBar() {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = imageView
    }
    
    private func setupNavigationControllerUI() {
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.appPurple
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        setCustomNavigationBar()
    }
}
