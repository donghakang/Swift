//
//  TableViewCell.swift
//  View and Image
//
//  Created by Dongha Kang on 2020/10/05.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let identifier = "myTableViewCell"
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
