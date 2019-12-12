//
//  CustomView.swift
//  Delegatepattern
//
//  Created by 황정덕 on 2019/12/10.
//  Copyright © 2019 Gitbot. All rights reserved.
//

// 1. 프로토콜 정의

protocol CustomViewDelegate: class {
    func colorForBackground(_ newColor: UIColor?) -> UIColor
}





import UIKit
//내가 언떤뷰를 정의해서 사용하려고 만듬 CustomView
class CustomView: UIView {
//    weak var delegate: CustomViewDelegate? // weak 은 클래스바운드여야 해서 프로토콜을 class 로 한정지어야한다
    
    //delegate 프로퍼티 선언
    weak var delegate: CustomViewDelegate?
    
    // 프로퍼티 옵저버?
    //
    // 오버라이드한 프로퍼티는 무조건 연산 프로퍼티로 get,set
    override var backgroundColor: UIColor? {
        get {
            return super.backgroundColor
        }
        set {
           // 뷰 컨트롤러에 맞는 상황에 맞게 설정하기 위해 delegate로 설정함
            //3. delegate 프로퍼티 함수 호출
            let color = delegate?.colorForBackground(newValue)      // color은 UIColor?  delegate의 옵셔널 체이닝으로 인해
            let newColor = ((color ?? newValue) ?? .gray)
            super.backgroundColor = newColor
            print("새로변경될 색은 : ", backgroundColor!)
            
            
            
            
//            // nil 일떄 블랙이고 red일떄  blue
//            super.backgroundColor = newValue ?? .black
//            if newValue == .red {
//                super.backgroundColor = .blue
//            }
//            print("새로변경될 색은 : ", backgroundColor!)
//

            
//            self.backgroundColor      //자기 자신에게 접근하기 떄문에 계쏙 셀프로 들어간다
//            guard let duck = newValue else {
//                super.backgroundColor = .black
//                print("새로변경될 색은 : ", backgroundColor!)
//                return
//            }
//            if let duck = newValue {
//                if duck == UIColor.red {
//                    super.backgroundColor = .red
//                    print("새로변경될 색은 : ", backgroundColor!)
//                }else{
//                    super.backgroundColor = newValue
//                    print("새로변경될 색은 : ", backgroundColor!)
//                }
//            }
//            super.backgroundColor = newValue    //super를 안붙이게 되면 UIVIEW가 가진게 아니라 커스텀 뷰가 가지고있기 떄문에
//            print("새로변경될 색은 : ", backgroundColor!)
        }
    }
    
}

//view 컨트롤러에서는 커스텀에대해 설정하고
//next 컴트롤러에서는 다르게 설정하고 싶을떄 ? 어떻게 할까
// 일부에서 다르게 설정하기 위해 delegate를 사용함
