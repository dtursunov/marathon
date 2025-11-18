enum AwesomeAssembly {
    static func assemble() -> AwesomeViewControllerImpl {
        let service = AwesomeServiceImpl(api: .init())
        let viewModel = AwesomeViewModelImpl(service: service)
        let view = AwesomeViewControllerImpl(viewModel: viewModel)
        viewModel.view = view
        return view
    }
}
