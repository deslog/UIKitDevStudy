//
//  UIFont+.swift
//  UIKitDevStudy
//
//  Created by LeeJiSoo on 2022/07/28.
//

import UIKit

extension UIFont {

    static func preferredFont(for style: TextStyle, weight: Weight) -> UIFont {

        let traits = UITraitCollection(preferredContentSizeCategory: .large)
        let desc = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style, compatibleWith: traits)

        let font = UIFont.systemFont(ofSize: desc.pointSize, weight: weight)

        let metrics = UIFontMetrics(forTextStyle: style)
        return metrics.scaledFont(for: font)
    }

}
