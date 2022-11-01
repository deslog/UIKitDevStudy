//
//  GotoView.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/11/01.
//

import UIKit

import Lottie

class GotoView: UIView {

    // MARK: - property

    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        label.sizeThatFits(label.frame.size)
        return label
    }()
    private lazy var lottieView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: lottieName)
        animationView.play()
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .repeat(2)
        return animationView
    }()
    private lazy var gotoButton: GotoSomewhereButton = {
        let button = GotoSomewhereButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.image = UIImage(systemName: "swift")
        return button
    }()

    private lazy var lottieName: String = ""
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - func

    private func setupLayout() {
        self.addSubview(self.greetingLabel)
        greetingLabel.constraint(top: self.topAnchor,
                                 centerX: self.centerXAnchor,
                                 padding: UIEdgeInsets.zero)


        self.addSubview(lottieView)
        lottieView.constraint(top: self.greetingLabel.bottomAnchor,
                              centerX: self.centerXAnchor,
                              padding: UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0))
        lottieView.constraint(.widthAnchor, constant: 434)
        lottieView.constraint(.heightAnchor, constant: 289)

        self.addSubview(self.gotoButton)
        gotoButton.constraint(top: self.lottieView.bottomAnchor,
                              bottom: self.bottomAnchor,
                              centerX: self.centerXAnchor,
                              padding: UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0))
    }

    func changeLabelText(greetingComments: String,
                         lottieImageTitle: String,
                         buttonImage: UIImage?,
                         buttonTitle: String) {
        self.greetingLabel.text = greetingComments
        self.lottieName = lottieImageTitle
        self.gotoButton.image = buttonImage
        self.gotoButton.title = buttonTitle

    }
}
