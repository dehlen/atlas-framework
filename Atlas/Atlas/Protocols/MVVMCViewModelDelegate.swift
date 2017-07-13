public protocol MVVMCViewModelDelegate: class {
    func viewModel(_ viewModel: MVVMCViewModelProtocol, requestsNavigation request: MVVMCNavigationRequest, withData data: [String : Any]?)
}
