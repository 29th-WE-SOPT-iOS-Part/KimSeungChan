//
//  MediaTableViewCell.swift
//  iOS-Assignment
//
//  Created by 김승찬 on 2021/10/28.
//

import UIKit

class MediaTableViewCell: UITableViewCell {

    @IBOutlet var mediaImageView: UIImageView!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var informationLabel: UILabel!
    
    static let identifier = "MediaTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
