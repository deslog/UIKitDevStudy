//
//  DaBuSoonDaButton.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/11/02.
//

import UIKit

class DaBuSoonDaButton: UIButton {

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - func

    private func configureUI() {
        self.layer.cornerRadius = 10
        self.titleLabel?.textAlignment = .center
        self.backgroundColor = .red
        self.imageView?.contentMode = .scaleAspectFit
        self.constraint(.heightAnchor, constant: 50)

        if #available(iOS 15.0, *) {
            configuration?.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(pointSize: 35)
            configuration?.imagePadding = 0
            configuration?.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 40)
        } else {
            self.imageEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 7, right: 30)
            self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            self.contentEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 30)
        }
    }


}
