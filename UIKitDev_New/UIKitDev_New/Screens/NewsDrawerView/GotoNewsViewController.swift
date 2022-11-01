//
//  GotoNewsViewController.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/11/01.
//

import UIKit

class GotoNewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let gotoview = GotoView()
        gotoview.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(gotoview)
        gotoview.constraint(top: self.view.topAnchor,
                            bottom: self.view.bottomAnchor,
                            centerX: self.view.centerXAnchor,
                            padding: UIEdgeInsets(top: 230, left: 0, bottom: 204, right: 0))

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
