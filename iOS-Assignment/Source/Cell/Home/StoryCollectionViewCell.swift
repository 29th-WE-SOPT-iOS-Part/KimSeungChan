//
//  StoryCollectionViewCell.swift
//  iOS-Assignment
//
//  Created by 김승찬 on 2021/10/28.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "StoryCollectionViewCell"

    @IBOutlet var storyNameLabel: UILabel!
    @IBOutlet var storyImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

}
