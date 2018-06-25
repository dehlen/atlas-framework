import Atlas

enum NavigationTargets: MVVMCNavigationTarget {
    case yellow
    
    func equals(obj: MVVMCNavigationTarget) -> Bool {
        guard let obj = obj as? NavigationTargets else {
            return false
        }
        
        return self == obj
    }
}
