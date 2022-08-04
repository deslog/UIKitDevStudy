//
//  UIStackView+.swift
//  UIKitDevStudy
//
//  Created by LeeJiSoo on 2022/07/28.
//

import UIKit

extension UIStackView {

    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
