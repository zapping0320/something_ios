//
//  NotebookTableViewCell.swift
//  something
//
//  Created by 김동현 on 2017. 11. 16..
//  Copyright © 2017년 John Kim. All rights reserved.
//

import UIKit

class NotebookTableViewCell: UITableViewCell {

    @IBOutlet weak var label_ol_name: UILabel!
    @IBOutlet weak var label_ol_countofnotes: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
