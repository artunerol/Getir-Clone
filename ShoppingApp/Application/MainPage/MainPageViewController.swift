//
//  ViewController.swift
//  ShoppingApp
//
//  Created by Erdem Perşembe on 12.04.2022.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBAction func buttonTapped(_ sender: Any) {
        NavigationRouter.navigate(fromViewController: self,
                                  destinationViewController: .detailPage,
                                  transitionStlye: .fullScreenWithNavigation)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
}
