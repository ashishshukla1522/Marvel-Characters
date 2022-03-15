//
//  CharacterDetailInfoCVCell.swift
//  Marvel
//
//  Created by Apple on 13/03/22.
//

import UIKit

class CharacterDetailInfoCVCell: UICollectionViewCell {
    @IBOutlet weak var characterDetailImagview: UIImageView!
    
    @IBOutlet weak var comicNameLabel: UILabel!
    
    class var identifier: String { return String(describing: self) }
    
    var comicCellViewModel: ComicListsCellViewModel? {
        didSet {
            comicNameLabel.text = comicCellViewModel?.comicName
        }
    }
    
    
}
