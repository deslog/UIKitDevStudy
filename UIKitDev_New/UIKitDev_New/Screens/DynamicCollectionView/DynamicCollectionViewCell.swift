//
//  DynamicCollectionViewCell.swift
//  UIKitDev_New
//
//  Created by 이지수 on 2022/10/18.
//

import UIKit

class DynamicCollectionViewCell: UICollectionViewCell {

    // MARK: properties

    static let identifier = "DynamicCollectionViewCell"

    // MARK: view

    private lazy var newsTitleLabel: UILabel = {
        $0.text = "우리는 왜 '타다'에 선뜻 타지 못했을까?"
        $0.backgroundColor = .yellow
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.preferredFont(forTextStyle: .title3)
        $0.numberOfLines = 0
        return $0
    }(UILabel())

    private lazy var newsCategoryLabel: UILabel = {
        $0.text = "시사"
        $0.backgroundColor = .green
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.preferredFont(forTextStyle: .caption2)
        return $0
    }(UILabel())

    // MARK: method

    func setupLayout() {
        [newsTitleLabel, newsCategoryLabel].forEach { addSubview($0) }
        NSLayoutConstraint.activate([
            newsTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 14.0),
            newsTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14.0),
            newsTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14.0),

            newsCategoryLabel.leadingAnchor.constraint(equalTo: newsTitleLabel.leadingAnchor),
            newsCategoryLabel.trailingAnchor.constraint(equalTo: newsTitleLabel.trailingAnchor),
            newsCategoryLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15.0)
        ])
    }
}
