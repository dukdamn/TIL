//
//  MemoListTableViewController.swift
//  MemoApp
//
//  Created by 황정덕 on 2020/01/13.
//  Copyright © 2020 Gitbot. All rights reserved.
//
//1.테이블 뷰 배치
//2.프로토타입 셀 디자인, 셀 아이덴티파이어 지정
//3.데이터 소소, 델리게이트 연결
//4.데이터 소스 구현
//5.델리게이트 구현
import UIKit

class MemoListTableViewController: UITableViewController {
  // 기본 날짜는 영어로 되어있음
  let formatter: DateFormatter = {
    let f = DateFormatter()
    f.dateStyle = .long
    f.timeStyle = .short
    f.locale = Locale(identifier: "Ko_kr")
    return f
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return Memo.dummyMemoList.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let target = Memo.dummyMemoList[indexPath.row]
    cell.textLabel?.text = target.content
    cell.detailTextLabel?.text = formatter.string(from: target.insertDate)
//    Memo.dummyMemoList[indexPath.row].insertDate.description
    // Configure the cell...
    
    return cell
  }
  
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
