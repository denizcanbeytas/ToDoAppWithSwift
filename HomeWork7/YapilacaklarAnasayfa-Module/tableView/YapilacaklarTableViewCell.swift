//
//  YapilacaklarTableViewCell.swift
//  HomeWork7
//
//  Created by Deniz on 19.03.2022.
//

import UIKit

class YapilacaklarTableViewCell: UITableViewCell {

    @IBOutlet weak var tableViewCellLabel: UILabel!
    @IBOutlet weak var tableViewCellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tableViewCellView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
