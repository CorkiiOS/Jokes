//
//  JKTabBarItemContentView.swift
//  Jokes
//
//  Created by 万启鹏 on 2019/7/24.
//  Copyright © 2019 iCorki. All rights reserved.
//

import ESTabBarController_swift

class JKTabBarItemContentView: ESTabBarItemContentView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        renderingMode = .alwaysOriginal
        textColor = UIColor(red: 43 / 255.0, green: 180 / 255.0, blue: 98 / 255.0, alpha: 1.0)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
