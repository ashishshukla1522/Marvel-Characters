//
//  AppDelegate.swift
//  Marvel
//
//  Created by Apple on 09/03/22.
//

import Foundation
import UIKit

class StoryboardAccessors: NSObject {
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}

