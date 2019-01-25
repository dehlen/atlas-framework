import Atlas

enum NavigationTargets: MVVMCNavigationTarget {
    case yellow
    case white
    
    func equals(obj: MVVMCNavigationTarget) -> Bool {
        guard let obj = obj as? NavigationTargets else {
            return false
        }
        
        return self == obj
    }
}
