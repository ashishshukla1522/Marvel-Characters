//
//  CharactersListTVCell.swift
//  Marvel
//
//  Created by Apple on 10/03/22.
//

import UIKit

class CharactersListTVCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterDescriptionLabel: UILabel!
    class var identifier: String { return String(describing: self) }
    
    var cellViewModel : CharactersListCellViewModel? {
        didSet {
            self.characterNameLabel.text = cellViewModel?.characterName
            self.characterDescriptionLabel.text = cellViewModel?.characterDescription
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        thumbnailImageView.setRadiusForSpecificCorners([.topLeft,.bottomLeft], radius: 10.0)
    }
    
}
