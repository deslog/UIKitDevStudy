//
//  GotoView.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/11/01.
//

import UIKit

class GotoView: UIView {

    // MARK: - property
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "안녕\n나는 이지수야"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    private let gotoButton: GotoSomewhereButton = {
        let button = GotoSomewhereButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.title = "요모조모 뉴스 바로가기"
        button.image = UIImage(systemName: "swift")
        return button
    }()

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - func

    private func setupLayout() {
        self.addSubview(self.greetingLabel)
        greetingLabel.constraint(top: self.topAnchor,
                                 centerX: self.centerXAnchor,
                                 padding: UIEdgeInsets.zero)

        self.addSubview(self.gotoButton)
        gotoButton.constraint(top: self.greetingLabel.bottomAnchor,
                              bottom: self.bottomAnchor,
                              centerX: self.centerXAnchor,
                              padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0))
    }
}
