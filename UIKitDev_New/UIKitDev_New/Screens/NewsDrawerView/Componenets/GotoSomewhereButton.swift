//
//  GotoSomewhereButton.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/11/01.
//

import UIKit

final class GotoSomewhereButton: UIButton {

    // MARK: - init

    var title: String = "" {
        didSet {
            configuration?.title = title
        }
    }

    var image: UIImage? = UIImage(systemName: "") ?? nil {
        didSet {
            configuration?.image = image
        }
    }

    convenience init() {
        self.init(configuration: .filled())
        configureUI()
        setupLayout()
    }

    private func configureUI() {
        configuration?.baseBackgroundColor = .tintColor
        configuration?.titleAlignment = .center
        configuration?.cornerStyle = .capsule
    }

    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 64)
        ])
    }
}
