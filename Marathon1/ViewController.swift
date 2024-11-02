import UIKit

fileprivate extension ViewController {
    enum Constants {
        // Square
        static let squareSize: CGFloat = 100
        static let leadingOffsetting: CGFloat = 100
        static let cornerRadius: CGFloat = 16
        
        // Gradient
        static let gradientStartPoint: CGPoint = .zero
        static let gradientEndPoint: CGPoint = .init(x: 1, y: 1)
        static let gradientColors: [CGColor] = [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor]
    }
}

final class ViewController: UIViewController {
    
    private let squareView = UIView()
    private let shadowView = UIView()
    private let gradient = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        drawShadow()
        drawSquare()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradient.frame = squareView.bounds
    }
    
    private func drawSquare() {
        squareView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(squareView)
        NSLayoutConstraint.activate([
            squareView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.leadingOffsetting),
            squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            squareView.widthAnchor.constraint(equalToConstant: Constants.squareSize),
            squareView.heightAnchor.constraint(equalToConstant: Constants.squareSize),
        ])
        
        squareView.layer.cornerRadius = Constants.cornerRadius
        squareView.layer.masksToBounds = true

        gradient.colors = Constants.gradientColors
        gradient.startPoint = Constants.gradientStartPoint
        gradient.endPoint = Constants.gradientEndPoint
        squareView.layer.addSublayer(gradient)
    }
    
    
    func drawShadow() {
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(shadowView)
        shadowView.centerYAnchor
            .constraint(equalTo: view.centerYAnchor).isActive = true
        shadowView.leadingAnchor
            .constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.leadingOffsetting + 8
            ).isActive = true
        shadowView.widthAnchor
            .constraint(equalToConstant: Constants.squareSize - 16).isActive = true
        shadowView.heightAnchor
            .constraint(equalToConstant: Constants.squareSize - 16).isActive = true
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowRadius = 16
        shadowView.layer.shadowOffset = .init(width: 16, height: 16)
        shadowView.layer.masksToBounds = false
        shadowView.backgroundColor = .blue
    }
}
