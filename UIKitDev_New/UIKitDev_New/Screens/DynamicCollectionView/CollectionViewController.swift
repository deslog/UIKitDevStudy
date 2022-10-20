////
////  CollectionViewController.swift
////  UIKitDev_New
////
////  Created by 이지수 on 2022/10/18.
////
//
//// ipadOS 로 해야함
//
//import UIKit
//
//class CollectionViewController: UIViewController {
//
//    let letters = ["안녕","안녕하세요","안녕하세요 저는 포마입니다.", "asdfasdasdfasdfasdfasdfasdfasdfasdfacwerfcaesdfasdfasdfasdfaasdfasdfasdfasdfasdfasdfafasdfas","안녕하세요 만나서 정말 반갑습니다."]
//
//    // MARK: view
//
//    private let collectionView: UICollectionView = {
//        let layout = CollectionViewLeftAlignFlowLayout()
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.backgroundColor = .systemPink
//        return collectionView
//    }()
//
//
//    // MARK: life cycle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureCollectionView()
//        setupLayout()
//    }
//
//    // MARK: private func
//
//    private func configureCollectionView() {
//
//        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
//        collectionView.collectionViewLayout = CollectionViewLeftAlignFlowLayout()
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        }
//        collectionView.delegate = self
//        collectionView.dataSource = self
//    }
//
//    private func setupLayout() {
//        view.addSubview(collectionView)
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 36),
//            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -36),
//            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
//        ])
//    }
//}
//
//// MARK: collectionView delegate
//
//extension CollectionViewController: UICollectionViewDelegate {
//
//}
//
////extension CollectionViewController: UICollectionViewDelegateFlowLayout {
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        let width = collectionView.frame.width
////        let numberOfItemsPerRow : CGFloat = 5
////        let spacing: CGFloat = 20
////        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
////        let itemDimension = floor(availableWidth / numberOfItemsPerRow)
////
////        return CGSize(width: itemDimension, height: 180)
////    }
////
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
////        return 20
////    }
////
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
////        return 20
////    }
////}
//
//// MARK: datasource
//
//extension CollectionViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return letters.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell
//        cell?.setupLayout()
//        cell?.newsTitleLabel.text = letters[indexPath.item]
//        return cell ?? UICollectionViewCell()
//    }
//}
//
//class CollectionViewLeftAlignFlowLayout: UICollectionViewFlowLayout {
//    let cellSpacing: CGFloat = 10
//
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        self.minimumLineSpacing = 10.0
//        self.sectionInset = UIEdgeInsets(top: 12.0, left: 16.0, bottom: 0.0, right: 16.0)
//        let attributes = super.layoutAttributesForElements(in: rect)
//
//        var leftMargin = sectionInset.left
//        var maxY: CGFloat = -1.0
//        attributes?.forEach { layoutAttribute in
//            if layoutAttribute.frame.origin.y >= maxY {
//                leftMargin = sectionInset.left
//            }
//            layoutAttribute.frame.origin.x = leftMargin
//            leftMargin += layoutAttribute.frame.width + cellSpacing
//            maxY = max(layoutAttribute.frame.maxY, maxY)
//        }
//        return attributes
//    }
//}
