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
    var titles: [String] = ["推荐", "图片", "视频"]
    var dataSource = [JXSegmentedBaseItemModel]()
    let tab = JXSegmentedView()
    lazy var listContainerView: JXSegmentedListContainerView! = {
        return JXSegmentedListContainerView(dataSource: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tab.dataSource = self
        tab.delegate = self
        tab.contentScrollView = listContainerView.scrollView
        reloadData(selectedIndex: 0)
        navigationItem.titleView = tab
        view.addSubview(listContainerView)
    }
    
    func reloadData(selectedIndex: Int) {
        dataSource.removeAll()
        for (index, _) in titles.enumerated() {
            let itemModel = JXSegmentedTitleItemModel()
            preferredRefreshItemModel(itemModel, at: index, selectedIndex: selectedIndex)
            dataSource.append(itemModel)
        }
    }
    
    override func viewWillLayoutSubviews() {
        tab.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 44)
        listContainerView.frame = view.bounds
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
        return false
    }
    
    open func preferredRefreshItemModel(_ itemModel: JXSegmentedBaseItemModel, at index: Int, selectedIndex: Int) {
        itemModel.index = index
        itemModel.selectedAnimationDuration = selectedAnimationDuration
        itemModel.isItemWidthZoomEnabled = isItemWidthZoomEnabled
        itemModel.itemWidthNormalZoomScale = 1
        if index == selectedIndex {
            itemModel.isSelected = true
            itemModel.itemWidthCurrentZoomScale = itemModel.itemWidthSelectedZoomScale
        }else {
            itemModel.isSelected = false
            itemModel.itemWidthCurrentZoomScale = itemModel.itemWidthNormalZoomScale
        }
        
        guard let myItemModel = itemModel as? JXSegmentedTitleItemModel else {
            return
        }
        
        myItemModel.title = titles[index]
        myItemModel.titleNormalColor = UIColor.gray
        myItemModel.titleSelectedColor = UIColor.red
        
        myItemModel.titleNormalZoomScale = 1.0
        myItemModel.titleSelectedZoomScale = 1.2
        myItemModel.isTitleZoomEnabled = true
//        myItemModel.isSelectedAnimable = true

//        myItemModel.titleNormalFont = titleNormalFont
//        myItemModel.titleSelectedFont = titleSelectedFont != nil ? titleSelectedFont! : titleNormalFont
//        myItemModel.isTitleZoomEnabled = isTitleZoomEnabled
//        myItemModel.isTitleStrokeWidthEnabled = true
//        myItemModel.isTitleMaskEnabled = isTitleMaskEnabled
//        myItemModel.titleNormalZoomScale = 1
//        myItemModel.titleSelectedZoomScale = titleSelectedZoomScale
//        myItemModel.titleSelectedStrokeWidth = titleSelectedStrokeWidth
        myItemModel.titleNormalStrokeWidth = 0
        if index == selectedIndex {
            myItemModel.titleCurrentColor = UIColor.red
            myItemModel.titleCurrentZoomScale = 1.2
//            myItemModel.titleCurrentStrokeWidth = titleSelectedStrokeWidth
        }else {
            myItemModel.titleCurrentColor = UIColor.gray
            myItemModel.titleCurrentZoomScale = 1
            myItemModel.titleCurrentStrokeWidth = 0
        }
    }
    
    func itemDataSource(in segmentedView: JXSegmentedView) -> [JXSegmentedBaseItemModel] {
        return  dataSource
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, widthForItemAt index: Int, isItemWidthZoomValid: Bool) -> CGFloat {
        return 80
    }
    
    func registerCellClass(in segmentedView: JXSegmentedView) {
        segmentedView.collectionView.register(JXSegmentedTitleCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, cellForItemAt index: Int) -> JXSegmentedBaseCell {
        let cell = segmentedView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        return cell
    }
    
    func refreshItemModel(_ segmentedView: JXSegmentedView, _ itemModel: JXSegmentedBaseItemModel, at index: Int, selectedIndex: Int) {
        preferredRefreshItemModel(itemModel, at: index, selectedIndex: selectedIndex)
    }
    
    func refreshItemModel(_ segmentedView: JXSegmentedView, currentSelectedItemModel: JXSegmentedBaseItemModel, willSelectedItemModel: JXSegmentedBaseItemModel, selectedType: JXSegmentedViewItemSelectedType) {
        
        guard let myCurrentSelectedItemModel = currentSelectedItemModel as? JXSegmentedTitleItemModel, let myWillSelectedItemModel = willSelectedItemModel as? JXSegmentedTitleItemModel else {
            return
        }
        
        myCurrentSelectedItemModel.titleCurrentColor = myCurrentSelectedItemModel.titleNormalColor
        myCurrentSelectedItemModel.titleCurrentZoomScale = myCurrentSelectedItemModel.titleNormalZoomScale
        myCurrentSelectedItemModel.titleCurrentStrokeWidth = myCurrentSelectedItemModel.titleNormalStrokeWidth
        myCurrentSelectedItemModel.indicatorConvertToItemFrame = CGRect.zero
        
        myWillSelectedItemModel.titleCurrentColor = myWillSelectedItemModel.titleSelectedColor
        myWillSelectedItemModel.titleCurrentZoomScale = myWillSelectedItemModel.titleSelectedZoomScale
        myWillSelectedItemModel.titleCurrentStrokeWidth = myWillSelectedItemModel.titleSelectedStrokeWidth
    }
    
    func refreshItemModel(_ segmentedView: JXSegmentedView, leftItemModel: JXSegmentedBaseItemModel, rightItemModel: JXSegmentedBaseItemModel, percent: CGFloat) {
        guard let leftModel = leftItemModel as? JXSegmentedTitleItemModel, let rightModel = rightItemModel as? JXSegmentedTitleItemModel else {
            return
        }
        
        leftModel.titleCurrentZoomScale = JXSegmentedViewTool.interpolate(from: leftModel.titleSelectedZoomScale, to: leftModel.titleNormalZoomScale, percent: CGFloat(percent))
        rightModel.titleCurrentZoomScale = JXSegmentedViewTool.interpolate(from: rightModel.titleNormalZoomScale, to: rightModel.titleSelectedZoomScale, percent: CGFloat(percent))
        
//        if isTitleStrokeWidthEnabled && isItemTransitionEnabled {
//            leftModel.titleCurrentStrokeWidth = JXSegmentedViewTool.interpolate(from: leftModel.titleSelectedStrokeWidth, to: leftModel.titleNormalStrokeWidth, percent: CGFloat(percent))
//            rightModel.titleCurrentStrokeWidth = JXSegmentedViewTool.interpolate(from: rightModel.titleNormalStrokeWidth, to: rightModel.titleSelectedStrokeWidth, percent: CGFloat(percent))
//        }
//
//        if isTitleColorGradientEnabled && isItemTransitionEnabled {
//            leftModel.titleCurrentColor = JXSegmentedViewTool.interpolateColor(from: leftModel.titleSelectedColor, to: leftModel.titleNormalColor, percent: percent)
//            rightModel.titleCurrentColor = JXSegmentedViewTool.interpolateColor(from:rightModel.titleNormalColor , to:rightModel.titleSelectedColor, percent: percent)
//        }
    }
}


extension JKJokesViewController: JXSegmentedListContainerViewDataSource {
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        return dataSource.count
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        return JKMoodViewController()
    }
}

extension JKJokesViewController: JXSegmentedViewDelegate {
    func segmentedView(_ segmentedView: JXSegmentedView, didSelectedItemAt index: Int) {
        segmentedView.reloadItem(at: index)
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, didClickSelectedItemAt index: Int) {
        //传递didClickSelectedItemAt事件给listContainerView，必须调用！！！
        listContainerView.didClickSelectedItem(at: index)
    }
    
    func segmentedView(_ segmentedView: JXSegmentedView, scrollingFrom leftIndex: Int, to rightIndex: Int, percent: CGFloat) {
        //传递scrollingFrom事件给listContainerView，必须调用！！！
        listContainerView.segmentedViewScrolling(from: leftIndex, to: rightIndex, percent: percent, selectedIndex: segmentedView.selectedIndex)
    }
}

extension UIViewController: JXSegmentedListContainerViewListDelegate {
    public func listView() -> UIView {
        return self.view
    }
}
