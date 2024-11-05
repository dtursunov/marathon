import UIKit

extension TaskListView {
    enum Taks {
        case one
        case two
        
        var title: String {
            switch self {
            case .one: return "Задание 1"
            case .two: return "Задание 2"
            }
        }
    }
}

final class TaskListView: UIViewController {
    
    private let tableView = UITableView()
    private let tasks: [TaskListView.Taks] = [.one, .two]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        tableView.register(cellType: UITableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 64
    }
}

extension TaskListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(UITableViewCell.self, for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].title
        return cell
    }
}

extension TaskListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let task = tasks[indexPath.row]
        let controller: UIViewController
        switch task {
        case .one:
            controller = TaskOneView()
        case .two:
            controller = TaskTwoView()
        }
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
