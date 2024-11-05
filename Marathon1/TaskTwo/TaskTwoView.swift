import UIKit

extension TaskTwoView {
    enum Constants {
        static let buttonImage: UIImage? = .init(systemName: "arrow.right.circle.fill")
    }
}

final class TaskTwoView: UIViewController {
    
    private let firstButton = TaskTwoButton(
        title: "First Button",
        image: Constants.buttonImage
    )

    private let secondButton = TaskTwoButton(
        title: "Second Medium Button",
        image: Constants.buttonImage
    )
    
    private let thirdButton = TaskTwoButton(
        title: "Third",
        image: Constants.buttonImage
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        [firstButton, secondButton, thirdButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        let action = UIAction { [weak self] _ in
            let controller = UIViewController()
            controller.view.backgroundColor = .systemBackground
            self?.present(controller, animated: true)
        }
        
        thirdButton.addAction(action, for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 8),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 8)
        ])
    }
}
