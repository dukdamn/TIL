//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        //view.frame.size = CGSize(width: 375, height: 667)
        view.backgroundColor = .white

        self.view = view
    }
    
    override func viewDidLoad() {
        print(view.frame.width)
        let blueView = setupSuperview()
        let greenView = setupSuperview1(superView: blueView)
        let redView = setupSuperview2(superView: greenView)
    }
    
    func setupSuperview() -> UIView {
        let blue = UIView()
        blue.frame = CGRect(x: 15, y: 15, width: 345, height: 637)
        blue.backgroundColor = .blue
        view.addSubview(blue)
        return blue
        
    }
    func setupSuperview1(superView: UIView) -> UIView {
        let green = UIView()
        green.frame = CGRect(x: superView.frame.minX + 15, y: superView.frame.minY + 15, width: superView.frame.width - 60, height: superView.frame.height - 60)
        
        green.backgroundColor = .green
        superView.addSubview(green)
        return green
    }
    func setupSuperview2(superView: UIView) -> UIView {
        let red = UIView()
        red.frame = CGRect(x: superView.frame.minX , y: superView.frame.minY , width: superView.frame.width - 60, height: superView.frame.height - 60)
        red.backgroundColor = .red
        superView.addSubview(red)
        return red
    }
    
}
// Present the view controller in the Live View window
let vc =  MyViewController()
vc.preferredContentSize  = CGSize(width: 375, height: 667)
PlaygroundPage.current.liveView = vc
