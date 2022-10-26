//
//  AddImageCollectionViewCell.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/10/27.
//

import UIKit

class AddImageCollectionViewCell: UICollectionViewCell {

    static let identifier = "AddImageCollectionViewCell"

    // MARK: view

    private let addBackgroundView: UIImageView = {
        let backgroundView = UIImageView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.contentMode = .scaleToFill
        backgroundView.clipsToBounds = true
        backgroundView.backgroundColor = .red
        return backgroundView
    }()

    // MARK: method

    func setupLayout() {
        addSubview(addBackgroundView)
        NSLayoutConstraint.activate([
            addBackgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            addBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            addBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            addBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
