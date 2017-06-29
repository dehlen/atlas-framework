protocol MVVMCModelProtocol {
    // MARK: - Observer
    func register(observer: MVVMCModelObserver)
    func deregister(observer: MVVMCModelObserver)
}
