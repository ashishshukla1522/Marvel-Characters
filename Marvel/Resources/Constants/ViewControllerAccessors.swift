//
//  ViewControllerAccessors.swift
//  OCE
//
//  Created by Amzon on 01/09/21.
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


 

