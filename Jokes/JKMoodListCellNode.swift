//
//  JKMoodListCellNode.swift
//  Jokes
//
//  Created by 万启鹏 on 2019/7/30.
//  Copyright © 2019 iCorki. All rights reserved.
//

import UIKit
import AsyncDisplayKit

private let iconSize = CGSize(width: 44, height: 44)
private let defaultColor = UIColor(red: 242 / 255.0, green: 242 / 255.0, blue: 242 / 255.0, alpha: 1.0)
private let defaultName = "Joke"

class JKMoodListCellNode: ASCellNode {
    var model: JKMoodListModel
    var icon: ASNetworkImageNode
    var name: ASTextNode
    var images: [ASNetworkImageNode]
    var image: ASNetworkImageNode
    var line: ASDisplayNode

    init(model: JKMoodListModel) {
        name = ASTextNode()
        icon = ASNetworkImageNode()
        image = ASNetworkImageNode()
        images = [ASNetworkImageNode]()
        line = ASDisplayNode()
        self.model = model
        super.init()
        initSubnodes()
    }
    
    private func initSubnodes() {
        selectionStyle = .none
        
        line.backgroundColor = defaultColor
        line.style.preferredSize = CGSize(width: bounds.size.width, height: 8)
        addSubnode(line)
        
        icon.style.preferredSize = iconSize
        icon.backgroundColor = defaultColor
        icon.cornerRadius = iconSize.width / 2
        addSubnode(icon)
        
        name.attributedText = NSAttributedString(string: defaultName)
        addSubnode(name)
        
        let text = ASTextNode()
        text.backgroundColor = defaultColor
        addSubnode(text)
        
        image.style.preferredSize = CGSize(width: bounds.size.width, height: 200)
        image.backgroundColor = defaultColor
        addSubnode(image)
        
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let iconSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 8, justifyContent: .start, alignItems: .center, children: [icon,name])
        let iconInset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 8, left: 10, bottom: 0, right: 0), child: iconSpec)
        let imageInset = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0), child: image)
        let resultSpec = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .stretch, children: [iconInset, imageInset, line])
        return resultSpec
    }
}
