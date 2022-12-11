//
//  BubbleScene.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/12/10.
//

import SpriteKit

extension CGFloat {
    public static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat.random() * (max - min) + min
    }
}

class BubblesScene: SIFloatingCollectionScene {
    var topOffset: CGFloat = 0

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        configure()
    }

    fileprivate func configure() {
        backgroundColor = SKColor.white
        scaleMode = .aspectFill
        // 여러개 선택 가능하게 configure!
        allowMultipleSelection = true
        var bodyFrame = frame
        bodyFrame.size.width = CGFloat(magneticField.minimumRadius)
        bodyFrame.origin.x -= bodyFrame.size.width / 2
        bodyFrame.size.height = frame.size.height
        bodyFrame.origin.y = frame.size.height - bodyFrame.size.height
        physicsBody = SKPhysicsBody(edgeLoopFrom: bodyFrame)
        magneticField.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2 / 2)
    }

    override func addChild(_ node: SKNode) {
        if node is BubbleNode {
            var x = CGFloat.random(min: 0, max: -node.frame.size.width)
            let y = CGFloat.random(
                min: frame.size.height - node.frame.size.height,
                max: frame.size.height - topOffset - node.frame.size.height
            )

            if floatingNodes.count % 2 == 0 || floatingNodes.isEmpty {
                x = CGFloat.random(
                    min: frame.size.width + node.frame.size.width,
                    max: frame.size.width
                )
            }
            node.position = CGPoint(x: x, y: y)
        }
        super.addChild(node)
    }

    func sortedFloatingNodes() -> [SIFloatingNode] {
        return floatingNodes.sorted { (node: SIFloatingNode, nextNode: SIFloatingNode) -> Bool in
            let distance = node.position.distance(from: magneticField.position)
            let nextDistance = nextNode.position.distance(from: magneticField.position)
            return distance < nextDistance && node.state != .selected
        }
    }
}
