//
//  ChooseInterestViewController.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/11/23.
//

import UIKit

class ChooseInterestViewController: UIViewController {

    // MARK: - property

    private lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.backgroundColor = .red
        scrollview.showsVerticalScrollIndicator = true
        scrollview.showsHorizontalScrollIndicator = true
        scrollview.contentSize = CGSize(width: UIScreen.main.bounds.width * 1.5, height: UIScreen.main.bounds.height * 1.5)
        return scrollview
    }()
    private let contentView: UIImageView = {
        let contentview = UIImageView()
        contentview.backgroundColor = .blue
        return contentview
    }()
    private let smallTitle: UILabel = {
        let label = UILabel()
        label.text = "요모조모에 온 것을 환영합니다."
        return label
    }()
    private let bigTitle: UILabel = {
        let label = UILabel()
        label.text = "마음에 드는 단어\n5개를 선택하세요"
        label.numberOfLines = 0
        return label
    }()

    private let image2: CategoryComponent = {
        let im = CategoryComponent(image: UIImage(systemName: "xmark")!, labelText: "ㅇㅁㄴㅇㄹㅁㅇㄴ")
        return im
    }()
    private let uiview: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        addGesture()
    }

    func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.didTappedCategory(_:)))
        self.uiview.addGestureRecognizer(gesture)
    }

    private func setupLayout() {

        self.view.addSubview(contentView)
        self.contentView.constraint(top: view.topAnchor,
                                    leading: view.leadingAnchor,
                                    bottom: view.bottomAnchor,
                                    trailing: view.trailingAnchor,
                                    padding: UIEdgeInsets.zero)

        self.contentView.addSubview(uiview)
        self.uiview.constraint(top: view.topAnchor,
                               leading: view.leadingAnchor,
                               padding: UIEdgeInsets(top: 300, left: 300, bottom: 0, right: 0))
        self.uiview.constraint(.widthAnchor, constant: 100)
        self.uiview.constraint(.heightAnchor, constant: 100)
    }

    // MARK: - selector

    @objc
    func didTappedCategory(_ sender: UITapGestureRecognizer) {
        print("왜안돼")
    }
}
