

import UIKit

class AnimationButtonViewController: UIViewController {
  private var leftButtons: [UIButton] = [UIButton(),UIButton(),UIButton(),UIButton(),UIButton()]
  private var rightButtons: [UIButton] = [UIButton(),UIButton(),UIButton(),UIButton(),UIButton()]
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  private func round(){
    for button in leftButtons {
      button.layer.cornerRadius = button.frame.width / 2
    }
    for button in rightButtons {
      button.layer.cornerRadius = button.frame.width / 2
    }
  }
  private func colorSet(){
    for button in leftButtons {
      button.layer.cornerRadius = button.frame.width / 2
    }
    for button in rightButtons {
      button.layer.cornerRadius = button.frame.width / 2
    }
  }
  
  
}
