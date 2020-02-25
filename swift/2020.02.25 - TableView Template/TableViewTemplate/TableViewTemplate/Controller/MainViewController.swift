
import UIKit

class MainViewController: UIViewController {
  private var viewControllers: [UIViewController] = []
  private let tableView: UITableView = {
    let tableView = UITableView()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "list")
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    
    tableViewSetUI()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewControllers = [
      DelegatePetternViewController(),
      MultiSectionTableViewController(),
    ]
  }
  private func tableViewSetUI() {
    self.title = "duck"
    let guide = view.safeAreaLayoutGuide
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: guide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
    ])
  }
}


// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewControllers.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath)
    cell.textLabel?.text = "\(viewControllers[indexPath.row].description)"
    cell.accessoryType = .disclosureIndicator
    return cell
  }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = viewControllers[indexPath.row]
    navigationController?.pushViewController(vc, animated: true)
  }
}

