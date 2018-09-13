public enum MVVMCNavigationRequest {
    case dismiss
    case request(target: MVVMCNavigationTarget)
    case overlay

    var navigationTarget: MVVMCNavigationTarget? {
        switch self {
            case .dismiss: return nil
            case .overlay: return nil
            case .request(let value): return value
        }
    }
}

func == (lhs: MVVMCNavigationRequest, rhs: MVVMCNavigationRequest) -> Bool {
    switch (lhs, rhs) {
        case (.dismiss, .dismiss): return true
        case (.request(let l), .request(let r)): return l.equals(obj:r)
        default: return false
    }
}
