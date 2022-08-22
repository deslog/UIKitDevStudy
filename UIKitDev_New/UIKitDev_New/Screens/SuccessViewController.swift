//
//  SuccessViewController.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/08/10.
//

import UIKit

class SuccessViewController: UIViewController {

    private let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .center
        $0.spacing = 0
        return $0
    }(UIStackView())

    private let nameLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "이익수 준장"
        $0.textColor = .red
        $0.numberOfLines = 0
        $0.setDynamicFont(for: .body, weight: .semibold)
        return $0
    }(UILabel())

    private let discriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "1968년 1.21사태 당시 무장공비 31명이 청와대를 습격하자 이를 추적하는 가운데 펼쳐진 포위작전 중 적의 습격으로 전사하였다."
        $0.textColor = .red
        $0.numberOfLines = 0
        $0.setDynamicFont(for: .body, weight: .bold)
        return $0
    }(UILabel())

    // MARK: - Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }

    // MARK: - Method

    private func layout() {
        view.addSubview(stackView)
        stackView.addArrangedSubviews(nameLabel, discriptionLabel)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -32)
        ])


    }
}
