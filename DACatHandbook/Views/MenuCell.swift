//
//  MenuCell.swift
//  DACatHandbook
//
//  Created by MinhNV-GD on 4/12/20.
//  Copyright © 2020 MinhNV-GD. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    static let identifier = "MenuCell"

    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
