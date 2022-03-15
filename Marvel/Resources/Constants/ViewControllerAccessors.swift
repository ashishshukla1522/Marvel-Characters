//
//  ViewControllerAccessors.swift
//  Marvel
//
//  Created by Apple on 09/03/22.
//

import Foundation
import UIKit

class ViewControllerAccessors {

    static var characterDetailVc: CharacterDetailVC {
        if let viewController = StoryboardAccessors.mainStoryboard.instantiateViewController(withIdentifier: "CharacterDetailVC") as? CharacterDetailVC{
            return viewController
        } else {
            return CharacterDetailVC()
        }
    }
}


 

