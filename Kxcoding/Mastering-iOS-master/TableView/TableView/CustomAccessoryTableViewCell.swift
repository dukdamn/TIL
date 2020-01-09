//
//  CustomAccessoryTableViewCell.swift
//  TableView
//
//  Created by 황정덕 on 2020/01/05.
//  Copyright © 2020 Keun young Kim. All rights reserved.
//

import UIKit

class CustomAccessoryTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      let v = UIImageView(image: UIImage(named: "star"))
      accessoryView = v
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
