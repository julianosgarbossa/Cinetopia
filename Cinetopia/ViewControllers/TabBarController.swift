//
//  TabBarController.swift
//  Cinetopia
//
//  Created by Juliano Sgarbossa on 03/06/25.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarController()
        self.setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    private func setupTabBarController() {
        let moviesViewController = UINavigationController(rootViewController: MoviesViewController())
        
        let symbolConfiguration = UIImage.SymbolConfiguration(scale: .medium)
        let moviesViewControllerSymbol = UIImage(systemName: "film", withConfiguration: symbolConfiguration)
        moviesViewController.tabBarItem.image = moviesViewControllerSymbol
        moviesViewController.tabBarItem.title = "Filmes Populares"
        
        let moviesFavoritesViewController = UINavigationController(rootViewController: MoviesFavoriteViewController())
        let moviesFavoritesViewControllerSymbol = UIImage(systemName: "heart", withConfiguration: symbolConfiguration)
        moviesFavoritesViewController.tabBarItem.image = moviesFavoritesViewControllerSymbol
        moviesFavoritesViewController.tabBarItem.title = "Favoritos"
        
        self.setViewControllers([moviesViewController, moviesFavoritesViewController], animated: true)
    }
}
