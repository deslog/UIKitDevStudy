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
    // long.count/2가 더 많은 경우
    var data: [newsData] = [
        newsData(newsTitle: "1인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "3인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "4인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "5인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "5인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "5인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "5인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "5인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "5인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "5인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "5인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "5인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "5인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "5인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "5인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "5인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "5인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "5인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "5인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "1급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
        newsData(newsTitle: "2급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
        newsData(newsTitle: "3급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
        newsData(newsTitle: "3급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사")
    ]

    // short.count가 더 많은 경우
//    var data: [newsData] = [
//        newsData(newsTitle: "1인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
//        newsData(newsTitle: "2인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
//        newsData(newsTitle: "3인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
//        newsData(newsTitle: "3인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
//        newsData(newsTitle: "3인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
//        newsData(newsTitle: "3인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
//        newsData(newsTitle: "1급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
//        newsData(newsTitle: "2급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
//        newsData(newsTitle: "3급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
//        newsData(newsTitle: "3급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
//        newsData(newsTitle: "3급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
//        newsData(newsTitle: "3급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
//        newsData(newsTitle: "3급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
//        newsData(newsTitle: "3급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
//        newsData(newsTitle: "3급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
//        newsData(newsTitle: "3급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
//        newsData(newsTitle: "3급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
//        newsData(newsTitle: "3급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
//        newsData(newsTitle: "3급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
//        newsData(newsTitle: "3급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
//        newsData(newsTitle: "3급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
//        newsData(newsTitle: "3급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
//        newsData(newsTitle: "3급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
//        newsData(newsTitle: "3급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사")
//    ]

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

    // MARK: 로직짜보자,,

    private func sortdata(_ data: [newsData]) -> [newsData] {
        let short = data.filter { $0.newsTitle.count < 30 }.map { $0 }
        let long = data.filter { $0.newsTitle.count >= 40 }.map { $0 }
        var newdata = [newsData]()
        if long.count / 2 <= short.count {
            newdata = calculateMoreShort(short, long)
        } else {
            newdata = calculateMoreLong(short, long)
        }

        return newdata
    }

    // MARK: calc

    private func calculateMoreLong( _ short: [newsData], _ long: [newsData]) -> [newsData] {
        var newdata = [newsData]()
        var long = long
        var short = short
        let longcount = long.count
        var needShortCount = 0

        if long.count % 2 == 0 {
            needShortCount = longcount/2  - (short.count+1)
        } else {
            needShortCount = longcount/2  - (short.count)
        }

        for _ in 0..<needShortCount {
            short.insert(newsData(newsTitle: "-", newsCategory: "-"), at: 0)
        }

        for i in 0..<longcount/2 {
            if i % 3 == 0 {
                newdata.append(long.removeLast())
                newdata.append(long.removeLast())
                if i == (longcount/2-1) {
                    continue
                } else {
                    newdata.append(short.removeLast())
                }
            } else if i % 3 == 1 {
                if i == (longcount/2-1) {
                    continue
                } else {
                    newdata.append(short.removeLast())
                }
                newdata.append(long.removeLast())
                newdata.append(long.removeLast())
            } else {
                newdata.append(long.removeLast())
                if i == (longcount/2-1) {
                    continue
                } else {
                    newdata.append(short.removeLast())
                }
                newdata.append(long.removeLast())
            }
        }

        if !long.isEmpty {
            newdata.append(long.removeLast())
        }

        if !short.isEmpty {
            for _ in 0..<short.count {
                newdata.append(short.removeLast())
            }
        }

        return newdata
    }

    private func calculateMoreShort(_ short: [newsData], _ long: [newsData]) -> [newsData] {
        var newdata = [newsData]()
        var long = long
        var short = short
        let longcount = long.count

        for i in 0..<longcount/2 {
            if i % 3 == 0 {
                newdata.append(long.removeLast())
                newdata.append(long.removeLast())
                newdata.append(short.removeLast())
            } else if i % 3 == 1 {
                newdata.append(short.removeLast())
                newdata.append(long.removeLast())
                newdata.append(long.removeLast())
            } else {
                newdata.append(long.removeLast())
                newdata.append(short.removeLast())
                newdata.append(long.removeLast())
            }
        }

        if !long.isEmpty {
            newdata.append(long.removeLast())
        }

        if !short.isEmpty {
            for _ in 0..<short.count {
                newdata.append(short.removeLast())
            }
        }

        return newdata
    }

    private func configureCollectionview() {
        collectionView.register(NewsFeedsCollectionViewCell.self, forCellWithReuseIdentifier: NewsFeedsCollectionViewCell.identifier)
        collectionView.register(AddImageCollectionViewCell.self, forCellWithReuseIdentifier: AddImageCollectionViewCell.identifier)
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

        if newdata[indexPath.row].newsTitle == "-" {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddImageCollectionViewCell.identifier, for: indexPath) as? AddImageCollectionViewCell else { return UICollectionViewCell() }
            cell.setupLayout()
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsFeedsCollectionViewCell.identifier, for: indexPath) as? NewsFeedsCollectionViewCell else { return UICollectionViewCell() }
            cell.setupLayout()
            cell.setData(newsTitle: newdata[indexPath.row].newsTitle, newsCategory: newdata[indexPath.row].newsCategory)
            return cell
        }
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
