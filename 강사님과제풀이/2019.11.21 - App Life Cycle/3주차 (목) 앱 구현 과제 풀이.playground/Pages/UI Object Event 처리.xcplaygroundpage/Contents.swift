
import UIKit
import PlaygroundSupport

/*
 UIButton
 1) +버튼 또는 -버튼을 누르면 숫자가 증가/감소하도록 만들기
 2) 숫자가 증가할 때는 label의 텍스트 색을 파란색, 감소할 때는 빨간색으로 변경
 */

final class MyViewController: UIViewController {

  let quantityLabel = UILabel()
  
  override func loadView() {
    let view = UIView()
    view.backgroundColor = .white
    self.view = view
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLabel()
    setupButton()
  }
  
  func setupLabel() {
    
    quantityLabel.frame = CGRect(x: 140, y: 100, width: 80, height: 30)
    quantityLabel.text = "0"
    quantityLabel.textColor = .darkText
    quantityLabel.textAlignment = .center
    quantityLabel.backgroundColor = .yellow
    view.addSubview(quantityLabel)
  }
  
  func setupButton() {
    let plusButton = UIButton()
    plusButton.frame = CGRect(x: 80, y: 150, width: 100, height: 30)
    plusButton.setTitle("+ Button", for: .normal)
    plusButton.setTitleColor(.black, for: .normal)
    plusButton.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.4)
    plusButton.addTarget(self, action: #selector(increaseQuantity), for: .touchUpInside)
    view.addSubview(plusButton)
    
    let minusButton = UIButton()
    minusButton.frame = CGRect(x: 180, y: 150, width: 100, height: 30)
    minusButton.setTitle("- Button", for: .normal)
    minusButton.setTitleColor(.black, for: .normal)
    minusButton.backgroundColor = UIColor.systemRed.withAlphaComponent(0.4)
    minusButton.addTarget(self, action: #selector(decreaseQuantity), for: .touchUpInside)
    view.addSubview(minusButton)
  }
  
  @objc func increaseQuantity() {
    guard let text = quantityLabel.text,
      let quantity = Int(text)
      else { return }
    quantityLabel.text = String(quantity + 1)
    quantityLabel.textColor = .blue
  }
  
  @objc func decreaseQuantity() {
    guard let text = quantityLabel.text,
      let quantity = Int(text)
      else { return }
    quantityLabel.text = String(quantity - 1)
    quantityLabel.textColor = .red
  }
}

PlaygroundPage.current.liveView = MyViewController()

