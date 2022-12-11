//
//  NewsFeedsCollectionViewCell.swift
//  UIKitDev_New
//
//  Created by 이지수 on 2022/10/20.
//

import UIKit

class NewsFeedsCollectionViewCell: UICollectionViewCell {

    // MARK: properties

    static let identifier = "NewsFeedsCollectionViewCell"

    // MARK: view

    private let newsBackgroundView: UIImageView = {
        let backgroundView = UIImageView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.contentMode = .scaleToFill
        backgroundView.clipsToBounds = true
        backgroundView.backgroundColor = .systemGray
        return backgroundView
    }()

    var newsTitleLabel: UILabel = {
        $0.text = "우리는 왜 '타다'에 선뜻 타지 못했을까?"
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.preferredFont(forTextStyle: .title2)
        $0.numberOfLines = 0
        return $0
    }(UILabel())

    var newsCategoryLabel: UILabel = {
        $0.text = "시사"
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.preferredFont(forTextStyle: .caption2)
        return $0
    }(UILabel())

    // MARK: method

    func setupLayout() {
        addSubview(newsBackgroundView)
        addSubview(newsTitleLabel)
        addSubview(newsCategoryLabel)

        NSLayoutConstraint.activate([
            newsBackgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            newsBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            newsBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            newsBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            newsTitleLabel.topAnchor.constraint(equalTo: newsBackgroundView.topAnchor, constant: 16.0),
            newsTitleLabel.leadingAnchor.constraint(equalTo: newsBackgroundView.leadingAnchor, constant: 16.0),
            newsTitleLabel.trailingAnchor.constraint(equalTo: newsBackgroundView.trailingAnchor, constant: -16.0),

            newsCategoryLabel.leadingAnchor.constraint(equalTo: newsTitleLabel.leadingAnchor),
            newsCategoryLabel.bottomAnchor.constraint(equalTo: newsBackgroundView.bottomAnchor, constant: -16.0)
        ])
    }

    func setData(newsTitle: String, newsCategory: String) {
        newsTitleLabel.text = newsTitle
        newsCategoryLabel.text = newsCategory
    }
}
