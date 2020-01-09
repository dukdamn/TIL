

import UIKit

class AccessoryViewViewController: UIViewController {
   
   @IBOutlet weak var listTableView: UITableView!
   
   @objc func toggleEditMode() {
      listTableView.setEditing(!listTableView.isEditing, animated: true)
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleEditMode))
   }
}


extension AccessoryViewViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 5
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    switch indexPath.row {
    case 0:
      //cell을 선택했을 때 푸쉬스타일로 화면전환
      cell.textLabel?.text = "Dislosure Indicator"
      cell.accessoryType = .disclosureIndicator
    case 1:
      //상세정보를 모달형태로 보여줄떄 사용
      //버튼은 액션으로 가져올수 없다
      //별도의 델리게이트 메소드를 이용해야한다
      cell.textLabel?.text = "Detail Button"
      cell.accessoryType = .detailButton
    case 2:
      //앞의 두가지의 내용을 가져옴
      cell.textLabel?.text = "Detail Disclosure Button"
      cell.accessoryType = .detailDisclosureButton
    case 3:
      // 선택상태를 체크할떄 사용
      cell.textLabel?.text = "Checkmark"
      cell.accessoryType = .checkmark
    case 4:
      return tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
    default:
      cell.textLabel?.text = "None"
      cell.accessoryType = .none
    }
      return cell
   }
}


extension AccessoryViewViewController: UITableViewDelegate {
  //셀을 선택했을 때 호출
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "pushSegue", sender: nil)
  }
  
  //디테일 버튼을 터치할떄 호출
  func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
    performSegue(withIdentifier: "modalSegue", sender: nil)
  }
}

















