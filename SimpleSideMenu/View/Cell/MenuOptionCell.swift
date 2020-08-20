//
//  MenuOptionCell.swift
//  SimpleSideMenu
//
//  Created by Raju Gupta on 19/08/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
