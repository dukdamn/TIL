
import UIKit

class MultiSectionTableViewViewController: UIViewController {
  let list = PhotosSettingSection.generateData()
   override func viewDidLoad() {
      super.viewDidLoad()
   }
  
  @objc func switchChanged(_ sender: UISwitch){
    print(sender.isOn, sender.tag)
  }
}

extension MultiSectionTableViewViewController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    list.count
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return list[section].items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let target = list[indexPath.section].items[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: target.type.rawValue, for: indexPath)
    
    switch target.type {
    case .detailTitle:
      cell.textLabel?.text = target.title
      cell.detailTextLabel?.text = target.subTitle
      cell.imageView?.image = UIImage(named: target.imageName! )
    case .switch:
      cell.textLabel?.text = target.title
      if let swithchView = cell.accessoryView as? UISwitch {
        swithchView.isOn = target.on
        swithchView.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        swithchView.tag = indexPath.section
      }
    case .checkmark:
      cell.textLabel?.text = target.title
      cell.accessoryType = target.on ? .checkmark : .none
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return list[section].header
  }
  func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    return list[section].footer
  }
}



















