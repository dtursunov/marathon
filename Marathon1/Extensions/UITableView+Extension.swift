import UIKit

public protocol Reusable {
    static var reuseIdentifier: String { get }
    static var nib: UINib { get }
}

extension Reusable {
    public static var reuseIdentifier: String {
        String(describing: self)
    }

    public static var nib: UINib {
        UINib(nibName: String(describing: self), bundle: nil)
    }
}

extension UICollectionReusableView: Reusable {}
extension UITableViewCell: Reusable {}
extension UITableViewHeaderFooterView: Reusable {}

extension UITableView {
    public func register(cellType: (some UITableViewCell & Reusable).Type) {
        register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    public func registerNib(cellType: (some UITableViewCell & Reusable).Type) {
        register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    public func dequeueCell<Cell: UITableViewCell & Reusable>(_ cell: Cell.Type, for indexPath: IndexPath) -> Cell {
        let dequeuedCell = dequeueReusableCell(withIdentifier: cell.reuseIdentifier, for: indexPath)
        guard let typedCell = dequeuedCell as? Cell else {
            fatalError(
                "Wrong cell type \(String(describing: dequeuedCell.self)) for identifier \(cell.reuseIdentifier)"
            )
        }
        return typedCell
    }
}
