//
//  ARViewController.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/08/10.
//

import UIKit
import SceneKit
import ARKit

class VRViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var arscene: ARSCNView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.arscene = ARSCNView(frame : self.view.frame)
        self.view.addSubview(arscene)
        arscene.delegate = self
        arscene.showsStatistics = true

        let scene = SCNScene()
        let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "testImage.jpg")
//        material.name = "image"
//        material.name = "Color"
//        box.materials = [material]
//        let node = SCNNode(geometry: box)
        let node = SCNNode()
        node.geometry = box
        node.geometry?.materials = [material]
        node.position = SCNVector3(-1, -1, -1.2)
        scene.rootNode.addChildNode(node)

//        scene.rootNode.addChildNode(sphereNode)

        let tapGestureRecognizer = UITapGestureRecognizer(target : self, action : #selector(tapped))
        self.arscene.addGestureRecognizer(tapGestureRecognizer)
        arscene.scene = scene
    }

    @objc func tapped(recognizer : UITapGestureRecognizer){
        let sceneView = recognizer.view as! SCNView
        let touchLocation : CGPoint = recognizer.location(in: sceneView)
        let hitResults : [SCNHitTestResult] = sceneView.hitTest(touchLocation, options: nil)

        if !hitResults.isEmpty {
            let node = hitResults[0].node
            self.presentingViewController?.dismiss(animated: true, completion: nil)
            print("AR box가 tap 되었습니다아")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let configuration = ARWorldTrackingConfiguration()

        arscene.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        arscene.session.pause()
    }
}
