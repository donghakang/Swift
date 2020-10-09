//
//  MyTabViewController.swift
//  UITabBarController
//
//  Created by Dongha Kang on 2020/10/09.
//

import UIKit

class MyTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 시작시 탭바를 세팅한다
        tabBar.items?[0].title = "First"
        tabBar.items?[1].title = "Second"
        tabBar.items?[2].title = "Third"
        
        tabBar.items?[0].image = UIImage(systemName: "person.fill")
        tabBar.items?[1].image = UIImage(systemName: "person")
        tabBar.items?[2].image = UIImage(systemName: "nose.fill")
        
        // 처음 시작할 때, 뱃지에 New를 활성화 시킨다.
        let tabBarItem = tabBar.items?[2]
        tabBarItem?.badgeValue = "New"
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // Third 탭이면, 뱃지를 지운다
        if item.title == "Third" {
            item.badgeValue = nil
        }
    }
}
