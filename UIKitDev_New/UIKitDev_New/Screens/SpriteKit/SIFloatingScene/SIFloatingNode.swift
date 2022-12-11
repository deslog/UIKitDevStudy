//
//  SIFloatingNode.swift
//  UIKitDev_New
//
//  Created by LeeJiSoo on 2022/12/10.
//

import SpriteKit

public enum SIFloatingNodeState {
    case normal
    case selected
}

open class SIFloatingNode: SKSpriteNode {
    private(set) var previousState: SIFloatingNodeState = .normal
    public var state: SIFloatingNodeState = .normal {
        didSet {
            if state != oldValue {
                previousState = oldValue
                stateChanged()
            }
        }
    }

    private static let selectingKey = "action.selecting"
    private static let normalizeKey = "action.normalize"

    private func stateChanged() {
        var action: SKAction?
        var actionKey: String?

        switch state {
        case .normal:
            action = normalizeAnimation()
            actionKey = SIFloatingNode.normalizeKey
        case .selected:
            action = selectingAnimation()
            actionKey = SIFloatingNode.selectingKey
        }

        if let action = action, let actionKey = actionKey {
            run(action, withKey: actionKey)
        }
    }

    // MARK: Animations

    open func selectingAnimation() -> SKAction? { return nil }
    open func normalizeAnimation() -> SKAction? { return nil }
}
