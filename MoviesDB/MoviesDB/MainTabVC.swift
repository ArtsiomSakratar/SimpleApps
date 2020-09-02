//
//  MainTabVC.swift
//  MoviesDB
//
//  Created by Artsiom Sakratar on 9/1/20.
//  Copyright © 2020 Artsiom Sakratar. All rights reserved.
//

import UIKit

class MainTabVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }


    private func setup() {
        let list = MoviesListVC()
        list.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(named: "movie"), tag: 0)
        
        let search = SearchVC()
        search.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), tag: 1)
        
        self.viewControllers = [UINavigationController(rootViewController: list), UINavigationController(rootViewController: search)]
    }

}
