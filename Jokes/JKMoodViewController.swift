//
//  JKMoodViewController.swift
//  Jokes
//
//  Created by 万启鹏 on 2019/7/24.
//  Copyright © 2019 iCorki. All rights reserved.
//

import UIKit
import AsyncDisplayKit
class JKMoodViewController: UIViewController {
    var tableNode = ASTableNode(style: .plain)
    var dataSource = [JKMoodListModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255, green: CGFloat(arc4random()%255)/255, blue: CGFloat(arc4random()%255)/255, alpha: 1)
        tableNode.delegate = self
        tableNode.dataSource = self
        tableNode.view.tableFooterView = UIView()
        tableNode.view.separatorStyle = .none
        view.addSubnode(tableNode)
        
        for _ in 0...20 {
            let model = JKMoodListModel()
            dataSource.append(model)
        }
        tableNode.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        tableNode.frame = view.bounds
    }

}

extension JKMoodViewController: ASTableDelegate {
    
}

extension JKMoodViewController: ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        return { () -> ASCellNode in
            return JKMoodListCellNode(model: self.dataSource[indexPath.row])
        }
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
}
