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
        tabBar.backgroundImage = whiteImage()
    }
    
    private func whiteImage() -> UIImage {
        guard let context: CGContext =  UIGraphicsGetCurrentContext() else { return UIImage() }
        UIGraphicsBeginImageContext(tabBar.bounds.size)
        context.setFillColor(UIColor.white.cgColor);
        context.fill(tabBar.bounds);
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
        UIGraphicsEndImageContext()
        return image
    }
}
