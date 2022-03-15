//
//  CharacterDetailVC.swift
//  Marvel
//
//  Created by Apple on 13/03/22.
//

import UIKit

class CharacterDetailVC: UIViewController {
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterDetailTableView: UITableView!
    
    
    var selectedCharacterInfo : CharactersListCellViewModel?
    
    var comicLists : ComicListResponse?
    
    lazy var comicslistViewModel = {
        ComicsListViewModel(_delegate: self)
    }()
    
    
    var imageManager = ImageManager()
    var activityIndicator = UIActivityIndicatorView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    
    
}
