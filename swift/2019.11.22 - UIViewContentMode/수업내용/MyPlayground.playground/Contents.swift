//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        print(MyViewController().self)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        let greenView = setupSuperview()
        let redView = setupSubview(superView: greenView)
        //let redView1 = setupSubview(superView: view)
        print("== grenView ==")
        print(greenView.frame)
        print(greenView.bounds)
        print()
        print("== grenView ==")
        print(redView.frame)
        print(redView.bounds)
        print()
        
        //greenView.frame.origin = CGPoint(x:0 , y:0) //슈퍼뷰를 기준으로 좌표를 변경
        //greenView.frame.origin = CGPoint(x:50 , y:50)
        //greenView.frame.origin = CGPoint(x:150 , y:150)
        
//        greenView.bounds.origin = CGPoint(x: 0, y:0)
        greenView.bounds.origin = CGPoint(x: 50, y:50)
//        greenView.bounds.origin = CGPoint(x: 150, y:150)
    
        print("== grenView ==")
        print(greenView.frame)
        print(greenView.bounds)
        print()
        print("== redView ==")
        print(redView.frame)
        print(redView.bounds)
        print()
        
    }
    func setupSuperview() -> UIView {
        let greenView = UIView()
        greenView.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        return greenView
    }
    func setupSubview(superView: UIView)-> UIView {
        let redView = UIView()  //서브뷰를 만들어서
        //슈퍼뷰를 기준으로 좌표 설정
        redView.frame = CGRect(x: 100, y: 100, width: 80, height: 80)
        redView.backgroundColor = .red
        superView.addSubview(redView)
        return redView
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
