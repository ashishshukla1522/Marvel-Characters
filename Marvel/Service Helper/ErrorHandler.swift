//
//  ErrorHandler.swift
//  Marvel
//
//  Created by Apple on 16/03/22.
//

import Foundation
import UIKit


class ErrorHandler {
    class func handleErrorWith(error: ErrorType, viewController controller:UIViewController ) {
        var errorMessage : String?
        switch error {
        case .ParsingError:
            errorMessage = "Error parsing the data."
        case .ErrorInFetchingDataFromServer:
            errorMessage = "Unable to fetch data from the server. Please try again later."
        }
        
        showErrorAlert(inViewController: controller, withMessage: errorMessage ?? "")
    }
    
    private class func showErrorAlert(inViewController viewController: UIViewController, withMessage message: String) {
        let alertController = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(doneAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
