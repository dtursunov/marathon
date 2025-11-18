
import UIKit

protocol AwesomeViewController: AnyObject {
    func updateUI(model: AwesomeData)
}
 
final class AwesomeViewControllerImpl: UIViewController {
 
    private let viewModel: AwesomeViewModel
    let button = UIButton()
    
    init(viewModel: AwesomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
       
        
        viewModel.viewDidLoad()
        button.addTarget(
            self,
            action: #selector(buttonTap),
            for: .touchUpInside
        )
    }
    
    @objc func buttonTap() {
        viewModel.buttonTapped()
    }
}

extension AwesomeViewControllerImpl: AwesomeViewController {
    func updateUI(model: AwesomeData) {
        printContent(model)
    }
}
