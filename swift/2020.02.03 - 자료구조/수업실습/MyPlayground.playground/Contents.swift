import UIKit

var str = "Hello, playground"

protocol LinkedListStack {
  var size: Int { get }     // 전체 개수
  var isEmpty: Bool { get } // 노드가 있는지 여부
  func push(node: Node)     // 데이터 삽입
  func pop() -> String?     // 데이터 추출
  func peek() -> String?    // 마지막 데이터 확인
}


final class Node {
  var value: String?
  var next: Node?
  init(value: String) {
    self.value = value
  }
}



final class SingleLinkedList: LinkedListStack {
  //  var node: Node?
  var size: Int = 0 {
    didSet { size = size < 0 ? 0 : size }
  }
  private var head: Node = Node(value: "")
  var isEmpty: Bool { return head.next == nil }
  var lastNode: Node? {
    guard var node = head.next else { return nil }
    while let nextNode = node.next {
      node = nextNode
    }
    return node
  }
  
  func push(node newNode: Node) {
//    강사님코드
    size += 1
    guard let node = lastNode else { return head.next = newNode }
    node.next = newNode
    
//    if self.head.value == "" {
//      self.head = node
//      return
//    }
//    var check = true
//    var duck: Node? = head
//    repeat {
//      if duck?.next == nil {
//        duck?.next = node
//        check = false
//      } else {
//        duck = duck?.next ?? nil
//      }
//    } while check
    
  }
  
  func pop() -> String? {
//    강사님 코드
    size -= 1
    guard var node = head.next else { return nil }
    while let nextNode = node.next {
      guard nextNode.next != nil else {
        node.next = nil
        return nextNode.value
      }
      node = nextNode
    }
    head.next = nil
    return node.value
//    var check = true
//    var duck: Node? = head
//    var preNode: Node?
//    repeat {
//      if duck?.next == nil {
//        check = false
//        preNode?.next = nil
//        return duck?.value
//      } else {
//        preNode = duck
//        duck = duck?.next ?? nil
//      }                                 
//    } while check
  }
  
  func peek() -> String? {
    return lastNode?.value
  }
}

var singleLinkedLst = SingleLinkedList()
singleLinkedLst.isEmpty

singleLinkedLst.push(node: Node(value: "a"))
//
singleLinkedLst.push(node: Node(value: "b"))
singleLinkedLst.push(node: Node(value: "c"))
singleLinkedLst.push(node: Node(value: "d"))
singleLinkedLst.push(node: Node(value: "e"))
singleLinkedLst.push(node: Node(value: "f"))
singleLinkedLst.push(node: Node(value: "g"))


singleLinkedLst.isEmpty

singleLinkedLst.pop()
singleLinkedLst.pop()
singleLinkedLst.pop()
singleLinkedLst.pop()
singleLinkedLst.pop()

//singleLinkedLst.last?.value

var duck = [1,2,3,4]


duck.endIndex


