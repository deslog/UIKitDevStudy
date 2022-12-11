//
//  CategoryComponent.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/11/23.
//

import UIKit
import SwiftUI

class CategoryComponent: UIView {

    private let backgroundImgae: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .black
        imageview.isUserInteractionEnabled = false
        return imageview
    }()
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "아이폰"
        label.textAlignment = .center
        return label
    }()

    init(image: UIImage, labelText: String) {
        super.init(frame: .zero)
        self.backgroundImgae.image = image
        self.categoryLabel.text = labelText

        self.setupLayout()

        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.didTappedCategory(_:)))
        self.backgroundImgae.addGestureRecognizer(gesture)
    }

    @objc
    func didTappedCategory(_ sender: UITapGestureRecognizer) {
        print("왜안돼")
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupLayout() {
        self.addSubview(backgroundImgae)
        backgroundImgae.constraint(top: self.topAnchor,
                                   leading: self.leadingAnchor,
                                   padding: UIEdgeInsets.zero)

        self.addSubview(categoryLabel)
        categoryLabel.constraint(centerX: backgroundImgae.centerXAnchor,
                                 centerY: backgroundImgae.centerYAnchor,
                                 padding: UIEdgeInsets.zero)
    }
    


}
