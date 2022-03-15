//
//  AppDelegate.swift
//  Marvel
//
//  Created by Apple on 09/03/22.
//

import Foundation
import UIKit

enum UIUserInterfaceIdiom : Int {
    case unspecified
    case iPhone // iPhone and iPod touch style UI
    case iPad   // iPad style UI (also includes macOS Catalyst)
}

let APPDELEGATE = UIApplication.shared.delegate as! AppDelegate
let SCENEDELEGATE =  UIApplication.shared.delegate as! SceneDelegate

//Screen Size
let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height



