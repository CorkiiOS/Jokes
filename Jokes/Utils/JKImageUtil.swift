//
//  JKImageUtil.swift
//  Jokes
//
//  Created by 万启鹏 on 2019/7/25.
//  Copyright © 2019 iCorki. All rights reserved.
//

import UIKit

public func whiteColorImage(size: CGSize) -> UIImage {
    UIGraphicsBeginImageContext(size)
    guard let context: CGContext =  UIGraphicsGetCurrentContext() else { return UIImage() }
    context.setFillColor(UIColor.white.cgColor);
    context.fill(CGRect(origin: CGPoint(x: 0, y: 0), size: size))
    guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
    UIGraphicsEndImageContext()
    return image
}
