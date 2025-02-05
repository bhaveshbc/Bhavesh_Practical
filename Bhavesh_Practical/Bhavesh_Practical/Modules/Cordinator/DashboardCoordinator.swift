//
//  DashboardCoordinator.swift
//  Bhavesh_Practical
//
//  Created by Bhavesh Chaudhari on 28/04/20.
//  Copyright © 2020 Bhavesh. All rights reserved.
//

import UIKit

class DashboardCoordinator: Coordinator {

    var childCoordinator = [Coordinator]()
    var navigationController: UINavigationController

    init() {
        let dashboardNavigation = UINavigationController()
//        dashboardNavigation.navigationItem.title = "Twitch Demo"
        self.navigationController = dashboardNavigation
    }

    /// initial point to start Dashboard flow.this method set rootViewController to DashBoardViewController.
    func start() {
        let dashboardController = DashboardViewController.instantiate(fromAppStoryboard: .main)
        dashboardController.coordinator = self
        navigationController.setViewControllers([dashboardController], animated: false)
        UIApplication.shared.keyWindow?.rootViewController = navigationController
    }

    func presentVideoPlayerController(with videos: [String], selectedIndex: Int) {
        let videoPlayerController = VideoPlayerViewController.instantiate(fromAppStoryboard: .main)
        videoPlayerController.videosArray = videos
        videoPlayerController.nextVideoIndex = selectedIndex
        self.navigationController.pushViewController(videoPlayerController, animated: true)
    }

}
