//
//  NotebookCell.swift
//  something
//
//  Created by 김동현 on 2017. 11. 6..
//  Copyright © 2017년 John Kim. All rights reserved.
//

import UIKit

class NotebookCell : UITableViewCell {
    
    @IBOutlet weak var label_name: UILabel!
    @IBOutlet weak var label_subtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.label_name.text = "gggg"
    }
}
