//
//  NewsFeedsViewController.swift
//  UIKitDev_New
//
//  Created by 이지수 on 2022/10/20.
//

import UIKit

class NewsFeedsViewController: UIViewController {

    // MARK: view

    private let dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.text = Date().formatted("EEEE, MMM d")
        return dateLabel
    }()

    private let newsFeedsTitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "요모조모 뉴스"
        titleLabel.setDynamicFont(for: .largeTitle, weight: .bold)

        return titleLabel
    }()

    private let titleDescriptionLabel: UILabel = {
        let titleDescriptionLabel = UILabel()
        titleDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        titleDescriptionLabel.text = "마음에 드는 뉴스를 선택하여 읽고 글을 쓸 수 있어요!"
        return titleDescriptionLabel
    }()

    private let collectionView: UICollectionView = {
        let layout = CollectionViewLeftAlignFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemPink
        return collectionView
    }()

    // MARK: life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }

    // MARK: private func

    private func setupLayout() {
        [dateLabel, newsFeedsTitleLabel, titleDescriptionLabel, collectionView].forEach { view.addSubview($0) }
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60.0),
            dateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),

            newsFeedsTitleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 25.0),
            newsFeedsTitleLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),

            titleDescriptionLabel.topAnchor.constraint(equalTo: newsFeedsTitleLabel.bottomAnchor, constant: 6.0),
            titleDescriptionLabel.leadingAnchor.constraint(equalTo: newsFeedsTitleLabel.leadingAnchor),

            collectionView.topAnchor.constraint(equalTo: titleDescriptionLabel.bottomAnchor, constant: 30.0),
            collectionView.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
