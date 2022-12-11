//
//  BubblePickerViewController.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/12/10.
//

import UIKit
import SpriteKit
import SwiftUI

class BubblePickerViewController: UIViewController {

    private var skView = SKView()
    private var floatingCollectionScene = BubblesScene()

    private var categoryList = [("art", "예술"), ("environment", "환경"), ("money", "돈"), ("animal", "동물"), ("company", "회사"), ("space", "우주"), ("economyIT", "IT"), ("economy", "경제"), ("robot", "로봇"), ("society", "사회"), ("broadcast", "방송"), ("culture", "문화"), ("history", "역사"), ("exercise", "운동"), ("health", "견강"), ("science", "과학"), ("world", "세계")]

    override func viewDidLoad() {
        super.viewDidLoad()
        skView = SKView(frame: UIScreen.main.bounds)
        skView.backgroundColor = SKColor.white
        view.addSubview(skView)

        floatingCollectionScene = BubblesScene(size: skView.bounds.size)
        floatingCollectionScene.topOffset = 0
        skView.presentScene(floatingCollectionScene)

        for indexNum in 0..<categoryList.count {
            addBubble(category: categoryList[indexNum].0, tag: indexNum)
        }
    }

    @objc func addBubble(category: String, tag: Int) {
        let image = UIImage(named: category)!
        let texture = SKTexture(image: image)
        let newNode = BubbleNode.instantiate(texture: texture, tag: categoryList[tag].1)

        newNode.selectedNode = {
            newNode.texture = SKTexture(image: UIImage(named: "selected_\(category)")!)
        }
        newNode.deselectedNode = {
            newNode.texture = SKTexture(image: UIImage(named: category)!)
        }
        floatingCollectionScene.addChild(newNode)
    }
}
