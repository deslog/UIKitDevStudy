//
//  ScrollAndButtonViewController.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/12/06.
//

import UIKit

class ScrollAndButtonViewController: UIViewController {

    private let scrollview: UIScrollView = {
        let scrollview = UIScrollView()
//        scrollview.isExclusiveTouch = false
//        scrollview.canCancelContentTouches = true
        scrollview.delaysContentTouches = true
        scrollview.backgroundColor = .white
        scrollview.showsVerticalScrollIndicator = false
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.height * 2)
        return scrollview
    }()

    private let imagebutton: UIButton = {
        let button = UIButton()
        button.isUserInteractionEnabled = true
        button.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
        button.setBackgroundImage(UIImage(named: "cuba"), for: UIControl.State.normal)
        button.addTarget(ScrollAndButtonViewController.self, action:#selector(imageButtonTapped(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }

    @objc func imageButtonTapped(_ sender:UIButton!) {
           print("My image button tapped")
    }

    private func layout() {
        view.addSubview(scrollview)
        scrollview.constraint(top: self.view.topAnchor,
                              leading: self.view.leadingAnchor,
                              bottom: self.view.bottomAnchor,
                              trailing: self.view.trailingAnchor,
                              padding: UIEdgeInsets.zero)

        self.scrollview.addSubview(imagebutton)
    }
}

//extension ScrollAndButtonViewController: UIGestureRecognizerDelegate {
//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        return !(gestureRecognizer is UIPanGestureRecognizer)
//    }
//}
