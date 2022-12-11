//
//  ScrollViewController.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/11/18.
//

import UIKit

class ScrollViewController: UIViewController {

    private let scrollview = UIScrollView()

    private let contentview1: UIView = {
        let contentview = UIView()
        contentview.translatesAutoresizingMaskIntoConstraints = false
        contentview.backgroundColor = .red
        return contentview
    }()
    private let contentview2: UIView = {
        let contentview = UIView()
        contentview.translatesAutoresizingMaskIntoConstraints = false
        contentview.backgroundColor = .blue
        return contentview
    }()
    private let label1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "dlrjlsrjaldjf;sd"
        return label
    }()
    private let label2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ASDFasdfasdfasdfasdfasdfasdfasdf"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollview)
        scrollview.addSubview(contentview1)
        scrollview.addSubview(contentview2)
        
    }
}
