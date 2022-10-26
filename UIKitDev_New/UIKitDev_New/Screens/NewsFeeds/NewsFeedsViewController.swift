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
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "인류보다 로봇 진화 속도가 더 빠르대요, 청소로봇은 '루시'…생각하는 로봇 등장", newsCategory: "시사"),
        newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
        newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
        newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사"),
        newsData(newsTitle: "급락한 카카오뱅크 주식, 카뱅이 사들이는 이유는", newsCategory: "시사")
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
        var short = data.filter { $0.newsTitle.count < 30 }.map { $0 }
        var long = data.filter { $0.newsTitle.count >= 40 }.map { $0 }
        let longcount = long.count
        var mid = [newsData]()
        var newdata = [newsData]()
        var lastloop = 0

        if long.count / 2 > short.count {
            lastloop = (long.count / 2) - short.count
            print("lastloop \(lastloop)")
        } else if long.count / 2 + 2 <= short.count {
            for _ in 0..<(long.count / 2) / 2 {
                mid.append(short.removeLast())
                mid.append(short.removeLast())
            }
        }

        if lastloop != 0 {
            for _ in 0..<lastloop {
                short.insert(newsData(newsTitle: "-", newsCategory: "-"), at: 0)
            }
        }

        for i in 0..<longcount/2 {
            if long.count == 1 {
                break
            }

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

        if mid.count != 0 {
            for i in stride(from: Int.random(in: 0...8), through: newdata.count, by: 5) {
                if newdata.count > i {
                    if newdata[i].newsTitle.count >= 40 {
                        newdata.insert(mid.removeLast(), at: i)
                        newdata.insert(mid.removeLast(), at: i+1)
                        newdata.append(newdata[i+2])
                        newdata.remove(at: i+2)
                    }
                }
            }
        }

        for s in short {
            newdata.append(s)
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
