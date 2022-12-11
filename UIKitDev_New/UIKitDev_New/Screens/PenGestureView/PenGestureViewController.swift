//
//  PenGestureViewController.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/12/06.
//

import UIKit
import UniformTypeIdentifiers

class PenGestureViewController: UIViewController {

    private let backgroundView: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = .red
        return uiview
    }()
    private let uiview: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = .red
        uiview.isUserInteractionEnabled = true
        return uiview
    }()
    private let imageview: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "cuba")
        imageview.contentMode = .scaleAspectFit
        return imageview
    }()
    private var label: UILabel = {
        let label = UILabel()
        label.text = "hello"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        layout()

        let pangesture = UIPanGestureRecognizer(target: self, action: #selector(self.drag))
        backgroundView.addGestureRecognizer(pangesture)
        //        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.didTappedCategory(_:)))
        //        gesture.delegate = self
        //        gesture.cancelsTouchesInView = false
        //        gesture.numberOfTapsRequired = 1
        //        gesture.numberOfTouchesRequired = 1
        //        self.uiview.addGestureRecognizer(gesture)
    }

    @objc func drag(sender: UIPanGestureRecognizer) {
        // self는 여기서 ViewController이므로 self.view ViewController가 기존에가지고 있는 view이다.
        let translation = sender.translation(in: self.view) // translation에 움직인 위치를 저장한다.

        // sender의 view는 sender가 바라보고 있는 circleView이다. 드래그로 이동한 만큼 circleView를 이동시킨다.
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        sender.setTranslation(.zero, in: self.view) // 0으로 움직인 값을 초기화 시켜준다.
    }

    @objc
    func didTappedCategory(_ sender: UITapGestureRecognizer) {
        print("왜안돼")
    }

    // MARK: - func

    private func layout() {
        view.addSubview(backgroundView)
        backgroundView.constraint(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: -300, right: -300))
        backgroundView.constraint(.widthAnchor, constant: view.bounds.width + 300)
        backgroundView.constraint(.heightAnchor,constant: view.bounds.height + 300)

        backgroundView.addSubview(uiview)
        uiview.constraint(top: backgroundView.topAnchor,
                          leading: backgroundView.leadingAnchor,
                          padding: UIEdgeInsets(top: 100, left: 100, bottom: 0, right: 0))
        uiview.constraint(.widthAnchor, constant: 200)
        uiview.constraint(.heightAnchor, constant: 200)

        uiview.addSubview(imageview)
        imageview.constraint(to: uiview)

        imageview.addSubview(label)
        label.constraint(centerX: imageview.centerXAnchor,
                         centerY: imageview.centerYAnchor,
                         padding: UIEdgeInsets.zero)
    }
}
