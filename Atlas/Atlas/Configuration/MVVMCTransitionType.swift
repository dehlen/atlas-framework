public enum MVVMCTransitionType {
    case modal(animated: Bool)
    case push(animated: Bool)
}

// MARK: - Equatable
extension MVVMCTransitionType: Equatable {
    public static func == (lhs: MVVMCTransitionType, rhs: MVVMCTransitionType) -> Bool {
        switch (lhs, rhs) {
        case (.modal, .modal): return true
        case let (.push(leftAnimated), .push(rightAnimated)): return leftAnimated == rightAnimated
        default: return false
        }
    }
}

