//
//  JKTabBarProvider.swift
//  Jokes
//
//  Created by 万启鹏 on 2019/7/24.
//  Copyright © 2019 iCorki. All rights reserved.
//

import ESTabBarController_swift

enum JKTabBarProvider {
    static func tabBarStyle() -> UITabBarController {
        let tabBarController = JKTabBarController()
        let v1 = JKNavigationController.init(rootViewController: JKJokesViewController())
        let v2 = JKNavigationController.init(rootViewController: JKMoodViewController())
        let v3 = JKNavigationController.init(rootViewController: JKMineViewController())
        
        let image = UIImage(named: "tabbar_icon_faxain_selected")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        v1.tabBarItem = ESTabBarItem(JKTabBarItemContentView(),
                                          title: "首页",
                                          image: R.image.tabbar_icon_tianwang_default()?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal),
                                          selectedImage: image,
                                          tag: 0)
        v2.tabBarItem = ESTabBarItem(JKTabBarItemContentView(),
                                         title: "动态",
                                         image: R.image.tabbar_icon_faxain_default()?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal),
                                         selectedImage: R.image.tabbar_icon_faxain_selected()?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal),
                                         tag: 0)
        v3.tabBarItem = ESTabBarItem(JKTabBarItemContentView(),
                                         title: "我的",
                                         image: R.image.tabbar_icon_main_default()?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal),
                                         selectedImage: R.image.tabbar_icon_main_selected()?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal),
                                         tag: 0)
        tabBarController.viewControllers = [v1, v2, v3]
        return tabBarController
    }
}
