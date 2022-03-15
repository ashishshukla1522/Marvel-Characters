//
//  CharacterInfoTvCell.swift
//  Marvel
//
//  Created by Apple on 13/03/22.
//

import UIKit

class CharacterInfoTvCell: UITableViewCell {
    
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterDetailLabel: UILabel!
    
    class var identifier: String { return String(describing: self) }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
