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

    // TODO: data 재정렬 어떻게 하는지 살펴보자.
    var data: [newsData] = [
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
        newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
        newsData(newsTitle: "금리 오르면 채권값 떨어지는 원리 이해해야", newsCategory: "지역"),
        newsData(newsTitle: "버팀목 수출마저 20% ↓…올 무역적자 327억달러", newsCategory: "시사"),
        newsData(newsTitle: "러시아의 화학자 드미트리 멘델레예프…원소를 원자량 순서로 배열해 주기율표 창안", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
        newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
        newsData(newsTitle: "금리 오르면 채권값 떨어지는 원리 이해해야", newsCategory: "지역"),
        newsData(newsTitle: "서인 정권의 '향명배금' 정책 고집…국제질서 변화 못읽어 정묘·병자호란 자초", newsCategory: "경제"),
        newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
        newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
        newsData(newsTitle: "금리 오르면 채권값 떨어지는 원리 이해해야", newsCategory: "지역"),
        newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
        newsData(newsTitle: "금리 오르면 채권값 떨어지는 원리 이해해야", newsCategory: "지역"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "경제"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
        newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
        newsData(newsTitle: "금리 오르면 채권값 떨어지는 원리 이해해야", newsCategory: "지역"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
        newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
        newsData(newsTitle: "금리 오르면 채권값 떨어지는 원리 이해해야", newsCategory: "지역"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "경제"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
        newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
        newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
        newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
        newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
        newsData(newsTitle: "실수와 오해가 친구를 위태롭게 할 수도 있다", newsCategory: "사회"),
        newsData(newsTitle: "금리 오르면 채권값 떨어지는 원리 이해해야", newsCategory: "지역")
    ]

    private lazy var newdata = sortdata(data)

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

    private func sortdata(_ data: [newsData]) -> [newsData] {
//        var count = 0
//        var temp = [newsData]()
//        var newData = [newsData]()
//
//        for i in 0..<data.count {
//            if count < 5 {
//                if data[i].newsTitle.count >= 30, count + 2 <= 5 {
//                    count += 2
//                    newData.append(data[i])
//                } else if data[i].newsTitle.count >= 30, count + 2 > 5 {
//                    temp.append(data[i])
//                } else if data[i].newsTitle.count < 30 {
//                    count += 1
//                    newData.append(data[i])
//                }
//            }
//
//            if count == 5 {
//                count = 0
//            }
//        }

        var long = data.filter { $0.newsTitle.count >= 30 }.map { $0 }
        var short = data.filter { $0.newsTitle.count < 30}.map { $0 }

        var newdata = [newsData]()
        var longCount = long.count
        var shortCount = short.count

        for _ in 0..<longCount/2 {
            if longCount % 2 == 1 {
                newdata.append(long.removeLast())
                newdata.append(short.removeLast())
                newdata.append(short.removeLast())
                newdata.append(short.removeLast())
            }

            for _ in 0..<2 {
                newdata.append(long.removeLast())
            }

            newdata.append(short.removeLast())
        }

        for i in short {
            newdata.append(i)
        }

        return newdata
    }

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
        return newdata.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsFeedsCollectionViewCell.identifier, for: indexPath) as? NewsFeedsCollectionViewCell else { return UICollectionViewCell() }
        cell.setupLayout()
        cell.setData(newsTitle: newdata[indexPath.row].newsTitle, newsCategory: newdata[indexPath.row].newsCategory)
        return cell
    }
}

extension NewsFeedsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        // MARK: - width 및 column 설정

        var width: CGFloat
        if newdata[indexPath.item].newsTitle.count > 30 {
            width = ((collectionView.frame.width - (12 * 4)) / 5) * 2 + 12
        } else {
            width = (collectionView.frame.width - (12 * 4)) / 5
        }

        return CGSize(width: width, height: 180)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}
