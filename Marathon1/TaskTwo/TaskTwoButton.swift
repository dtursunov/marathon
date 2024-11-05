import UIKit

extension TaskTwoButton {
    enum Constants {
        static let contentInset: NSDirectionalEdgeInsets = .init(top: 10, leading: 14, bottom: 10, trailing: 14)
        static let imagePadding: CGFloat = 8
        static let cornerRadius: CGFloat = 10
        static let animnationDuration: TimeInterval = 0.2
        static let scale: CGAffineTransform = .init(scaleX: 0.9, y: 0.9)
        
        static let backgroundColor: UIColor = UIColor { traitCollection in
            switch traitCollection.userInterfaceLevel {
            case .base, .unspecified:
                UIColor.systemBlue
            case .elevated:
                UIColor.red
            @unknown default:
                UIColor.systemBlue
            }
        }
    }
}

class TaskTwoButton: UIButton {
    init(title: String, image: UIImage?) {
        super.init(frame: .zero)
        
        var config = UIButton.Configuration.filled()
        config.imagePlacement = .trailing
        config.cornerStyle = .medium
        config.contentInsets = Constants.contentInset
        config.imagePadding = Constants.imagePadding
        config.baseBackgroundColor = Constants.backgroundColor
        config.title = title
        config.image = image
        configuration = config

    }
        
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: Constants.animnationDuration) {
            self.transform = Constants.scale
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: Constants.animnationDuration) {
            self.transform = .identity
        }
    }
    
}
