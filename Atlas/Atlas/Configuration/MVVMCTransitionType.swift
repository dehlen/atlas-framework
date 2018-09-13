public enum MVVMCTransitionType {
    case modal(animated: Bool)
    case push(animated: Bool)
    case overlay
}

// MARK: - Equatable
extension MVVMCTransitionType: Equatable {
    public static func == (lhs: MVVMCTransitionType, rhs: MVVMCTransitionType) -> Bool {
        switch (lhs, rhs) {
        case (.modal(_), .modal(_)): return true
        case let (.push(_), .push(_)): return true
        case (.overlay, .overlay): return true
        default: return false
        }
    }
}

