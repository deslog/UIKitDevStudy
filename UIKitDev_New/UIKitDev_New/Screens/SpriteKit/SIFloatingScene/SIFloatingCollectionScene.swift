//
//  SIFloatingCollectionScene.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/12/10.
//

import SpriteKit

extension CGPoint {
    func distance(from point: CGPoint) -> CGFloat {
        return hypot(point.x - self.x, point.y - self.y)
    }
}

@objc public protocol SIFloatingCollectionSceneDelegate {
    @objc optional func floatingScene(_ scene: SIFloatingCollectionScene, shouldSelectFloatingNodeAt index: Int) -> Bool
    @objc optional func floatingScene(_ scene: SIFloatingCollectionScene, didSelectFloatingNodeAt index: Int)

    @objc optional func floatingScene(_ scene: SIFloatingCollectionScene, shouldDeselectFloatingNodeAt index: Int) -> Bool
    @objc optional func floatingScene(_ scene: SIFloatingCollectionScene, didDeselectFloatingNodeAt index: Int)
}

public enum SIFloatingCollectionSceneMode {
    case normal
//    case editing
    case moving
}

open class SIFloatingCollectionScene: SKScene {
    // skfieldNode: 물리학 효과를 적용시켜주는 node
    // radialGravityField: 물리 가속을 주는..? (???)
    public private(set) var magneticField = SKFieldNode.radialGravityField()
    private(set) var mode: SIFloatingCollectionSceneMode = .normal {
        didSet {
            modeUpdated()
        }
    }
    public private(set) var floatingNodes: [SIFloatingNode] = []

    private var touchPoint: CGPoint?
    private var touchStartedTime: TimeInterval?
    private var removingStartedTime: TimeInterval?

    open var allowMultipleSelection = true
    open var restrictedToBounds = true
    open var pushStrength: CGFloat = 10000

    open weak var floatingDelegate: SIFloatingCollectionSceneDelegate?

    // didMove: Tells you when the scene is presented by a view.
    override open func didMove(to view: SKView) {
        super.didMove(to: view)
        configure()
    }


    // MARK: Frame Updates

    override open func update(_ currentTime: TimeInterval) {
        floatingNodes.forEach { (node) in
            let distanceFromCenter = self.magneticField.position.distance(from: node.position)
            // linearDamping : 선형 속도를 줄이는 속성, 길수록 가운데로 모이는 선형 속도가 느림!!
            node.physicsBody?.linearDamping = 0.01

            if distanceFromCenter <= 100 {
                node.physicsBody?.linearDamping += ((100 - distanceFromCenter) / 10)
            }
        }
    }

    // MARK: Touching Handlers

    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch? {
            touchPoint = touch.location(in: self)
            touchStartedTime = touch.timestamp
        }
    }

    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch? {
            let plin = touch.previousLocation(in: self)
            let lin = touch.location(in: self)
            var dx = lin.x - plin.x
            var dy = lin.y - plin.y
            let b = sqrt(pow(lin.x, 2) + pow(lin.y, 2))
            dx = b == 0 ? 0 : (dx / b)
            dy = b == 0 ? 0 : (dy / b)

            if dx == 0 && dy == 0 {
                return
            }
            else if mode != .moving {
                mode = .moving
            }

            for node in floatingNodes {
                let w = node.frame.size.width / 2
                let h = node.frame.size.height / 2
                var direction = CGVector(
                    dx: pushStrength * dx,
                    dy: pushStrength * dy
                )

                if restrictedToBounds {
                    if !(-w...(size.width + w) ~= node.position.x) && (node.position.x * dx) > 0 {
                        direction.dx = 0
                    }

                    if !(-h...(size.height + h) ~= node.position.y) && (node.position.y * dy) > 0 {
                        direction.dy = 0
                    }
                }
                node.physicsBody?.applyForce(direction)
            }
        }
    }

    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if mode != .moving, let touchPoint = touchPoint {
            if let node = atPoint(touchPoint) as? SIFloatingNode {
                updateState(of: node)
            }
        }
        mode = .normal
    }

    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        mode = .normal
    }

    open func floatingNode(at index: Int) -> SIFloatingNode? {
        if 0..<floatingNodes.count ~= index {
            return floatingNodes[index]
        }
        return nil
    }

    open func indexOfSelectedNode() -> Int? {
        return indexesOfSelectedNodes().first
    }

    open func indexesOfSelectedNodes() -> [Int] {
        var indexes: [Int] = []

        for (i, node) in floatingNodes.enumerated() {
            if node.state == .selected {
                indexes.append(i)
            }
        }
        return indexes
    }

    override open func atPoint(_ p: CGPoint) -> SKNode {
        var currentNode = super.atPoint(p)

        while !(currentNode.parent is SKScene) && !(currentNode is SIFloatingNode)
            && (currentNode.parent != nil) && !currentNode.isUserInteractionEnabled {
                currentNode = currentNode.parent!
        }
        return currentNode
    }

    private func updateState(of node: SIFloatingNode) {
        if let index = floatingNodes.firstIndex(of: node) {
            switch node.state {
            case .normal:
                if shouldSelectNode(at: index) {
                    if !allowMultipleSelection, let selectedIndex = indexOfSelectedNode() {
                        let node = floatingNodes[selectedIndex]
                        updateState(of: node)
                    }
                    node.state = .selected
                    floatingDelegate?.floatingScene?(self, didSelectFloatingNodeAt: index)
                }
            case .selected:
                if shouldDeselectNode(at: index) {
                    node.state = .normal
                    floatingDelegate?.floatingScene?(self, didDeselectFloatingNodeAt: index)
                }
            }
        }
    }

    // MARK: Configuration

    override open func addChild(_ node: SKNode) {
        if let newNode = node as? SIFloatingNode {
            configureNode(newNode)
            floatingNodes.append(newNode)
        }
        super.addChild(node)
    }

    private func configure() {
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        magneticField = SKFieldNode.radialGravityField()
        magneticField.region = SKRegion(radius: 10000)
        magneticField.minimumRadius = 10000
        magneticField.strength = 8000
        magneticField.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(magneticField)
    }

    private func configureNode(_ node: SIFloatingNode!) {
        // 물리적인 충돌을 구현하기 위한 ,,,
        // https://developer.apple.com/documentation/spritekit/sknode/getting_started_with_physics_bodies
        if node.physicsBody == nil {
            node.physicsBody = SKPhysicsBody(circleOfRadius: max(node.size.width / 2 + 20, node.size.height / 2 + 20))
        }

        node.physicsBody?.isDynamic = true
        node.physicsBody?.affectedByGravity = false
        node.physicsBody?.allowsRotation = false
        node.physicsBody?.mass = 0.3
        node.physicsBody?.friction = 0
        node.physicsBody?.linearDamping = 3
    }

    private func modeUpdated() {
        switch mode {
        case .normal, .moving:
            touchStartedTime = nil
            removingStartedTime = nil
            touchPoint = nil
        }
    }

    // MARK: Floating Delegate Helpers

    private func shouldSelectNode(at index: Int) -> Bool {
        if let shouldSelect = floatingDelegate?.floatingScene?(self, shouldSelectFloatingNodeAt: index) {
            return shouldSelect
        }
        return true
    }

    private func shouldDeselectNode(at index: Int) -> Bool {
        if let shouldDeselect = floatingDelegate?.floatingScene?(self, shouldDeselectFloatingNodeAt: index) {
            return shouldDeselect
        }
        return true
    }
}
