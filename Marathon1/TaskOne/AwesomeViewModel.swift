import Foundation

protocol AwesomeViewModel {
    func viewDidLoad()
    func buttonTapped()
}

final class AwesomeViewModelImpl: AwesomeViewModel {
    private var awesomeSet: Set<AwesomeData> = []
    private var timer: Timer?
    weak var view: AwesomeViewController?

    private let service: AwesomeService
    
    init(service: AwesomeService) {
        self.service = service
    }
    
    func viewDidLoad() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(runTimedCode),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc
    private func runTimedCode() {
        loadData()
    }
    
    private func loadData() {
        service.getAwesomeData(someId: 0) { result in
            switch result {
                case .success(let data):
                    data.forEach {
                        self.awesomeSet.insert($0)
                    }
                case .failure:
                    break
            }
        }
    }
    
    func buttonTapped() {
        if let model = awesomeSet.min() {
            view?.updateUI(model: model)
        }
    }
}
