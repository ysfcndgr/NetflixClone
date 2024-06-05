//
//  ViewController.swift
//  NetflixClone
//
//  Created by Can on 26.01.2024.
//

import UIKit

final class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar()
    }
    
    private func tabBar(){
        tabBar.tintColor = .label
        let homeVC = createNavigationController(with: HomeViewController(), title: "Home", imageName: "house.fill")
               let upComingVC = createNavigationController(with: UpComingViewController(), title: "Upcoming", imageName: "play.circle")
               let searchVC = createNavigationController(with: SearchViewController(), title: "Search", imageName: "magnifyingglass")
               let downloadsVC = createNavigationController(with: DownloadsViewController(), title: "Downloads", imageName: "arrow.down.to.line.alt")

               setViewControllers([homeVC, upComingVC, searchVC, downloadsVC], animated: true)
    }
    
    private func createNavigationController(with rootViewController: UIViewController, title: String, imageName: String) -> UINavigationController {
            let navigationController = UINavigationController(rootViewController: rootViewController)
            navigationController.tabBarItem.title = title
            navigationController.tabBarItem.image = UIImage(systemName: imageName)
            return navigationController
        }


}

