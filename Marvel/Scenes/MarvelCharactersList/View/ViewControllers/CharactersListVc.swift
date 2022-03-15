//
//  CharactersListVc.swift
//  Marvel
//
//  Created by Apple on 10/03/22.
//

import UIKit

class CharactersListVc: UIViewController {

    //IBOutlet
    
    @IBOutlet weak var charactersListTableView: UITableView!
    
    //Public Variables
    var imageManager = ImageManager()
    var pagingManager: PagingInfo = PagingManager()
    
    lazy var charactersListViewModel = {
        CharactersListViewModel( _delegate: self)
    }()
    
    
    var currentOffset = 0
    //ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
        // Do any additional setup after loading the view.
    }


}
