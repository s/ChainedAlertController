//
//  UIViewController+ChainedAlert.swift
//  ChainedAlert
//
//  Created by Said Ozcan on 13/06/2018.
//  Copyright © 2018 Said Ozcan. All rights reserved.
//

import UIKit

extension UIViewController {
    func showChainedAlert(alert: ChainedAlertTree) {
        // First alert
        switch alert {
        case .alert(var current, let next):
            
            guard let nextChain = next else {
                showChainedAlert(alert: current)
                return
            }
            
            // updating all the actions in current chain to trigger next
            // which says shouldTriggerNext: true
            let updatedActions = current.actions.map { (originalAction) -> ChainedAlertAction in
                
                guard originalAction.shouldTriggerNextAlert else { return originalAction }
                
                let newHandler: (ChainedAlertAction) -> Void = { [weak self] (newAlertAction) in
                    
                    // first calling the initial handler if exists
                    if let originalHandler = originalAction.handler {
                        originalHandler(originalAction)
                    }
                    
                    // then triggering next one
                    if originalAction.shouldTriggerNextAlert {
                        self?.showChainedAlert(alert: nextChain)
                    }
                }
                
                return ChainedAlertAction(title: originalAction.title, style: originalAction.style, shouldTriggerNextAlert: originalAction.shouldTriggerNextAlert, handler: newHandler)
            }
            
            current.actions = updatedActions
            showChainedAlert(alert: current)
            break
        }
    }
    
    fileprivate func showChainedAlert(alert: ChainedAlert) {
        let alertController = UIAlertController.alertController(from: alert)
        present(alertController, animated: true, completion: nil)
    }
}
