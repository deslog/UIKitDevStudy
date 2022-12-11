//
//  SelectUIViewViewController.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/12/03.
//

import UIKit

class SelectUIViewViewController: UIViewController, UIGestureRecognizerDelegate {

//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
//        shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer)
//        -> Bool {
//        return true
//    }

//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
//    shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        return (gestureRecognizer is UIPanGestureRecognizer || gestureRecognizer is UITapGestureRecognizer) && (otherGestureRecognizer is UIPanGestureRecognizer || otherGestureRecognizer is UITapGestureRecognizer)
//    }

    private let scrollview: UIScrollView = {
        let scrollview = UIScrollView()
//        scrollview.isExclusiveTouch = false
//        scrollview.canCancelContentTouches = true
//        scrollview.delaysContentTouches = true
        scrollview.backgroundColor = .white
        scrollview.showsVerticalScrollIndicator = false
        scrollview.showsHorizontalScrollIndicator = false
        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width * 2, height: UIScreen.main.bounds.height * 2)
        return scrollview
    }()
//    private let contentView = UIImageView()

    private let uiview: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = .red
        uiview.isUserInteractionEnabled = true
        return uiview
    }()
    private let imageview: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "cuba")
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    private var label: UILabel = {
        let label = UILabel()
        label.text = "hello"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()

        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.didTappedCategory(_:)))
        gesture.delegate = self
        gesture.cancelsTouchesInView = false
        self.uiview.addGestureRecognizer(gesture)
    }

    @objc
    func didTappedCategory(_ sender: UITapGestureRecognizer) {
        print("왜안돼")
    }

    // MARK: - func

    private func layout() {
        view.addSubview(scrollview)
        scrollview.constraint(top: self.view.topAnchor,
                              leading: self.view.leadingAnchor,
                              bottom: self.view.bottomAnchor,
                              trailing: self.view.trailingAnchor,
                              padding: UIEdgeInsets.zero)

//        self.scrollview.addSubview(self.contentView)
        
        scrollview.addSubview(uiview)
        uiview.constraint(top: scrollview.topAnchor,
                          leading: scrollview.leadingAnchor,
                          padding: UIEdgeInsets(top: 100, left: 100, bottom: 0, right: 0))
        uiview.constraint(.widthAnchor, constant: 200)
        uiview.constraint(.heightAnchor, constant: 200)

        uiview.addSubview(imageview)
        imageview.constraint(to: uiview)

        imageview.addSubview(label)
        label.constraint(centerX: imageview.centerXAnchor,
                         centerY: imageview.centerYAnchor,
                         padding: UIEdgeInsets.zero)
    }
}

//extension SelectUIViewViewController: UIGestureRecognizerDelegate {
//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        return !(gestureRecognizer is UIPanGestureRecognizer)
//    }
//}
