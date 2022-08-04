//
//  RealTimeViewController.swift
//  UIKitDevStudy
//
//  Created by LeeJiSoo on 2022/07/28.
//

import UIKit

class RealTimeViewController: UIViewController {

    // MARK: View

    private let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
        $0.spacing = 8
        return $0
    }(UIStackView())

    private let clockDescriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "지금 한국은"
        $0.textColor = .red
        $0.setDynamicFont(for: .body, weight: .semibold)
        return $0
    }(UILabel())

    private let statusDescriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "전화 가능 시간이 아니에요."
        $0.textColor = .red
        $0.setDynamicFont(for: .body, weight: .bold)
        return $0
    }(UILabel())

    private let realTimeClockLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .red
        $0.setDynamicFont(for: .largeTitle, weight: .black)
        return $0
    }(UILabel())

    // MARK: Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setTimer()
    }

    // : Method

    private func attribute() {

    }

    private func layout() {
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42)
        ])

        stackView.addArrangedSubviews(clockDescriptionLabel, realTimeClockLabel, statusDescriptionLabel)
    }

    private func setTimer() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.currentTimeToKoreaTime(_:)), userInfo: nil, repeats: true)
    }
}

extension RealTimeViewController {

    @objc private func currentTimeToKoreaTime(_ sender: Timer) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "Asia/Seoul")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        dateFormatter.dateFormat = "HH:mm"
        let currentLocationDate = Date()
        let koreaTime = dateFormatter.string(from: currentLocationDate)
        realTimeClockLabel.text = koreaTime
    }
}
