//
//  UIColor+.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/08/09.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return (CGFloat(arc4random()) / CGFloat(UInt32.max))
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: .random(), green: .random(), blue: .random(), alpha: 1.0)
    }
}

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

extension UIFont {

    static func preferredFont(for style: TextStyle, weight: Weight) -> UIFont {

        let traits = UITraitCollection(preferredContentSizeCategory: .large)
        let desc = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style, compatibleWith: traits)

        let font = UIFont.systemFont(ofSize: desc.pointSize, weight: weight)

        let metrics = UIFontMetrics(forTextStyle: style)
        return metrics.scaledFont(for: font)
    }

}

extension UIStackView {

    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}

extension Date {
    /**
     # formatted
     - Parameters:
        - format: 변형할 DateFormat
     - Note: DateFormat으로 변형한 String 반환
    */
    public func formatted(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
