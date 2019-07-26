//
//  JKJokesViewController.swift
//  Jokes
//
//  Created by 万启鹏 on 2019/7/24.
//  Copyright © 2019 iCorki. All rights reserved.
//

import UIKit
import JXSegmentedView
class JKJokesViewController: UIViewController {
    let tab = JXSegmentedView()
    lazy var listContainerView: JXSegmentedListContainerView! = {
        return JXSegmentedListContainerView(dataSource: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tab.dataSource = self
        tab.contentScrollView = listContainerView.scrollView
        view.addSubview(tab)
        view.addSubview(listContainerView)
        
    }
}

extension JKJokesViewController: JXSegmentedViewDataSource {
    var isItemWidthZoomEnabled: Bool {
        return true
    }
    
    var selectedAnimationDuration: TimeInterval {
        return 0.25
    }
    
    var itemSpacing: CGFloat {
        return 30
    }
    
    var isItemSpacingAverageEnabled: Bool {
        return true
    }
    
    func itemDataSource(in segmentedView: JXSegmentedView) -> [JXSegmentedBaseItemModel] {
        return [JXSegmentedBaseItemModel(),JXSegmentedBaseItemModel(),JXSegmentedBaseItemModel()]
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, widthForItemAt index: Int, isItemWidthZoomValid: Bool) -> CGFloat {
        return 0
    }
    
    func registerCellClass(in segmentedView: JXSegmentedView) {
        
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, cellForItemAt index: Int) -> JXSegmentedBaseCell {
        return JXSegmentedBaseCell()
    }
    
    func refreshItemModel(_ segmentedView: JXSegmentedView, _ itemModel: JXSegmentedBaseItemModel, at index: Int, selectedIndex: Int) {
        
    }
    
    func refreshItemModel(_ segmentedView: JXSegmentedView, currentSelectedItemModel: JXSegmentedBaseItemModel, willSelectedItemModel: JXSegmentedBaseItemModel, selectedType: JXSegmentedViewItemSelectedType) {
        
    }
    
    func refreshItemModel(_ segmentedView: JXSegmentedView, leftItemModel: JXSegmentedBaseItemModel, rightItemModel: JXSegmentedBaseItemModel, percent: CGFloat) {
        
    }
}


extension JKJokesViewController: JXSegmentedListContainerViewDataSource {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return 3
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        return JKMoodViewController()
    }
}

extension JKMoodViewController: JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return self.view
    }
}
