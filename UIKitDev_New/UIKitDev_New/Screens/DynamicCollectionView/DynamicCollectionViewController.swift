//
//  DynamicCollectionViewController.swift
//  UIKitDev_New
//
//  Created by 이지수 on 2022/10/18.
//

// ipadOS 로 해야함

import UIKit

class DynamicCollectionViewController: UIViewController {

    // MARK: view

    private let collectionView: UICollectionView = {
        $0.backgroundColor = .red
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()))


    // MARK: life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setupLayout()
    }

    // MARK: private func

    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DynamicCollectionViewCell.self, forCellWithReuseIdentifier: DynamicCollectionViewCell.identifier)
    }

    private func setupLayout() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: collectionView delegate

extension DynamicCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 36
        return CGSize(width: width, height: 380.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let value = 16.0
        return UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
}

extension DynamicCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DynamicCollectionViewCell.identifier, for: indexPath) as? DynamicCollectionViewCell
        cell?.setupLayout()
        return cell ?? UICollectionViewCell()
    }
}
