//
//  PageControlViewController.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/12/01.
//

import UIKit

class PageControlViewController: UIViewController {
    
    private let pageControl: UIPageControl = {
        let pagecontrol = UIPageControl()
        pagecontrol.isHidden = true
        return pagecontrol
    }()
    private lazy var scrollview: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width,
                                        height: UIScreen.main.bounds.height * 2)
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.showsVerticalScrollIndicator = false
        scrollview.isScrollEnabled = true
        scrollview.isPagingEnabled = true
        scrollview.bounces = false
        return scrollview
    }()
    private let uiview1: UIView = {
        let view = UIView()
        view.backgroundColor =  .red
        return view
    }()
    private let firstlabel: UILabel = {
        let label = UILabel()
        label.text = "glkasdjlkajds;fa"
        return label
    }()
    private let uiview2: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    private lazy var contentviews: [UIView] = [self.uiview1, self.uiview2]
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layout()
//        scrollview.delegate = self
        addContentScrollView()
        setPageControl()
    }
    
    // MARK: - func
    
    private func layout() {
        view.addSubview(scrollview)
        scrollview.constraint(top: view.topAnchor,
                              leading: view.leadingAnchor,
                              bottom: view.bottomAnchor,
                              trailing: view.trailingAnchor,
                              padding: UIEdgeInsets.zero)
        view.addSubview(pageControl)
        pageControl.constraint(bottom: view.bottomAnchor,
                               centerX: view.centerXAnchor,
                               padding: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))

        uiview1.addSubview(firstlabel)
        firstlabel.constraint(top: uiview1.topAnchor, leading: uiview1.leadingAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0))
    }
    
    private func addContentScrollView() {
        for i in 0..<2 {
            let view = contentviews[i]
            view.frame = UIScreen.main.bounds
            view.frame.origin.y = UIScreen.main.bounds.height * CGFloat(i)
            scrollview.addSubview(view)
        }
    }
    
    private func setPageControl() {
        pageControl.numberOfPages = 2
    }
    
//    private func setPageControlSelectedPage(currentPage:Int) {
//        pageControl.currentPage = currentPage
//    }
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let value = scrollView.contentOffset.y/scrollView.frame.size.height
//        setPageControlSelectedPage(currentPage: Int(round(value)))
//    }
}
