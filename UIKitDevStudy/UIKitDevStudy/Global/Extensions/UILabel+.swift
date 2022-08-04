//
//  UILabel+.swift
//  UIKitDevStudy
//
//  Created by LeeJiSoo on 2022/07/28.
//

import UIKit

extension UILabel {

    func setDynamicFont(_ style: UIFont.TextStyle) {
        self.font = UIFont.preferredFont(forTextStyle: style)
        self.adjustsFontForContentSizeCategory = true
        self.numberOfLines = 0
    }

    func setDynamicFont(for style: UIFont.TextStyle, weight: UIFont.Weight = .regular) {
        self.font = UIFont.preferredFont(for: style, weight: weight)
        self.adjustsFontForContentSizeCategory = true
        self.numberOfLines = 0
    }
}
