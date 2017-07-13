protocol MVVMCCoordinatorProtocol: MVVMCStartable, MVVMCChildCoordinatorDelegate, MVVMCViewModelDelegate {
    var coordinatorDelegate: MVVMCChildCoordinatorDelegate? { get set }
}
