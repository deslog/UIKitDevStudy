//
//  ButtonViewController.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/08/10.
//

import UIKit

class ButtonViewController: UIViewController {

    // MARK: - View

    private let testButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("여기누르면 AR나오지롱", for: .normal)
        $0.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 11, leading: 16, bottom: 11, trailing: 16)
        $0.configuration?.cornerStyle = .medium
        $0.configuration?.baseBackgroundColor = .red
        $0.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        return $0
    }(UIButton(configuration: .filled()))

    // MARK: - Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }

    // MARK: - Method

    private func layout() {
        view.addSubview(testButton)

        NSLayoutConstraint.activate([
            testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func buttonDidTap(_ sender: Any) {
        if sender is UIButton {
            print("button tapped")
        }

        let storyboard = UIStoryboard(name: "VRView", bundle: nil)
        guard let nextVC = storyboard.instantiateViewController(withIdentifier: "VRViewController") as? VRViewController else {
            return
        }
        self.present(nextVC, animated: true)
    }
}
