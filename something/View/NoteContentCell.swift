//
//  NoteContentCell.swift
//  something
//
//  Created by 김동현 on 2018. 5. 14..
//  Copyright © 2018년 John Kim. All rights reserved.
//

import Foundation
import UIKit

class NoteContentCell: UITableViewCell {
    
    @IBOutlet weak var label_datetime: UILabel!
    @IBOutlet weak var label_title: UILabel!
    @IBOutlet weak var label_content: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
