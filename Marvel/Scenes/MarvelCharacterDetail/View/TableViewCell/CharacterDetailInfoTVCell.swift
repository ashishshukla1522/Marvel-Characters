//
//  CharacterDetailInfoTVCell.swift
//  Marvel
//
//  Created by Apple on 13/03/22.
//

import UIKit

class CharacterDetailInfoTVCell: UITableViewCell {
    
    @IBOutlet weak var characterDetailCollectionView: UICollectionView!
    @IBOutlet weak var characterDetailTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
