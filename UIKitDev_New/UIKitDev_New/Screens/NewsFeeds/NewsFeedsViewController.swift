//
//  NewsFeedsViewController.swift
//  UIKitDev_New
//
//  Created by 이지수 on 2022/10/20.
//

import UIKit

struct newsData {
    let newsTitle: String
    let newsCategory: String
}

class NewsFeedsViewController: UIViewController {

    let data: [newsData] = [
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "버팀목 수출마저 20% ↓…올 무역적자 327억달러", newsCategory: "시사"),
        newsData(newsTitle: "러시아의 화학자 드미트리 멘델레예프…원소를 원자량 순서로 배열해 주기율표 창안", newsCategory: "시사"),
        newsData(newsTitle: "서인 정권의 '향명배금' 정책 고집…국제질서 변화 못읽어 정묘·병자호란 자초", newsCategory: "경제"),
        newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
        newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
        newsData(newsTitle: "금리 오르면 채권값 떨어지는 원리 이해해야", newsCategory: "지역"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "경제"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
        newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
        newsData(newsTitle: "금리 오르면 채권값 떨어지는 원리 이해해야", newsCategory: "지역"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "경제"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사")
    ]

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
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionview()
        setupLayout()
    }

    // MARK: private func

    private func configureCollectionview() {
        collectionView.register(NewsFeedsCollectionViewCell.self, forCellWithReuseIdentifier: NewsFeedsCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

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

extension NewsFeedsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsFeedsCollectionViewCell.identifier, for: indexPath) as? NewsFeedsCollectionViewCell else { return UICollectionViewCell() }
        cell.setupLayout()
        cell.setData(newsTitle: data[indexPath.row].newsTitle, newsCategory: data[indexPath.row].newsCategory)
        return cell
    }
}

extension NewsFeedsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = collectionView.frame.width
//        let numberOfItemsPerRow : CGFloat = 5
//        let spacing: CGFloat = 20
//        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
//        let itemDimension = floor(availableWidth / numberOfItemsPerRow)
        let width = (collectionView.frame.width - (12 * 4)) / 5
        return CGSize(width: width, height: 180)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}