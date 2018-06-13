//
//  ViewController.swift
//  ChainedAlertController
//
//  Created by Said Ozcan on 13/06/2018.
//  Copyright © 2018 Said Ozcan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    fileprivate lazy var firstAction: ChainedAlertTree = {
        let cancelAction = ChainedAlertAction(title: "Cancel", style: .cancel, shouldTriggerNextAlert: false, handler: nil)
        let triggerNextAction = ChainedAlertAction(title: "Trigger next", style: .default, shouldTriggerNextAlert: true, handler: nil)
        let alert = ChainedAlert(title: "First alert title", message: "First alert message", actions: [cancelAction, triggerNextAction])
        return ChainedAlertTree.alert(alert: alert, nextAlert: secondAction)
    }()
    
    fileprivate lazy var secondAction: ChainedAlertTree = {
        let cancelAction = ChainedAlertAction(title: "Cancel", style: .cancel, shouldTriggerNextAlert: false, handler: nil)
        let triggerNextAction = ChainedAlertAction(title: "Trigger next", style: .default, shouldTriggerNextAlert: true, handler: nil)
        let alert = ChainedAlert(title: "Second action title", message: "Second action message", actions: [cancelAction, triggerNextAction])
        return ChainedAlertTree.alert(alert: alert, nextAlert: thirdAction)
    }()
    
    fileprivate lazy var thirdAction: ChainedAlertTree = {
        let cancelAction = ChainedAlertAction(title: "It's enough.", style: .cancel, shouldTriggerNextAlert: false, handler: nil)
        let alert = ChainedAlert(title: "Third action title", message: "Third action message", actions: [cancelAction])
        return ChainedAlertTree.alert(alert: alert, nextAlert: nil)
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.showChainedAlert(alert: strongSelf.firstAction)
        }
    }
}

