//
//  BubbleNode.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/12/10.
//

import Foundation

import UIKit
import SpriteKit

class BubbleNode: SIFloatingNode {
    var selectedNode: (() -> ())?
    var deselectedNode: (() -> ())?

    // node 내부에 라벨을 넣기 위해서 생성한 프로퍼티
    var labelNode = SKLabelNode(fontNamed: "")
    var text: String = ""

    class func instantiate(texture: SKTexture, tag: String) -> BubbleNode {
        let node = BubbleNode(texture: texture)

        node.labelNode.text = tag
        node.labelNode.position = CGPoint.zero
        node.labelNode.fontColor = SKColor.white
        node.labelNode.fontSize = 20

        node.labelNode.verticalAlignmentMode = .center
        node.labelNode.horizontalAlignmentMode = .center
        node.addChild(node.labelNode)
        return node
    }

    override func selectingAnimation() -> SKAction? {
        selectedNode?()
        return SKAction.scale(to: 1.3, duration: 0.2)
    }

    override func normalizeAnimation() -> SKAction? {
        deselectedNode?()
        return SKAction.scale(to: 1, duration: 0.2)
    }
}
