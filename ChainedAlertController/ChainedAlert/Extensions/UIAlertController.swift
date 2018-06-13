//
//  UIAlertController.swift
//  ChainedAlert
//
//  Created by Said Ozcan on 13/06/2018.
//  Copyright © 2018 Said Ozcan. All rights reserved.
//

import UIKit

extension UIAlertController {
    func add(actions: [UIAlertAction]) {
        for action in actions {
            addAction(action)
        }
    }
    
    static func alertController(from alertModel: ChainedAlert) -> UIAlertController {
        let alertController = UIAlertController(title: alertModel.title, message: alertModel.message, preferredStyle: .alert)
        
        let actions: [UIAlertAction] = alertModel.actions.map { actionModel -> UIAlertAction in
            return UIAlertAction(title: actionModel.title, style: actionModel.style) { action in
                if let handler = actionModel.handler {
                    handler(actionModel)
                }
            }
        }
        
        alertController.add(actions: actions)
        
        return alertController
    }
}
