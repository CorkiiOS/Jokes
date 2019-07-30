//
//  JKTabBarController.swift
//  Jokes
//
//  Created by 万启鹏 on 2019/7/24.
//  Copyright © 2019 iCorki. All rights reserved.
//

import ESTabBarController_swift
import CoreGraphics
class JKTabBarController: ESTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = UIColor.white
        tabBar.backgroundImage = whiteColorImage(size: tabBar.bounds.size)
    }
}
