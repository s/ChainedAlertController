//
//  ChainedAlertAction.swift
//  ChainedAlertController
//
//  Created by Said Ozcan on 13/06/2018.
//  Copyright © 2018 Said Ozcan. All rights reserved.
//

import UIKit

struct ChainedAlertAction {
    let title: String
    let style: UIAlertActionStyle
    let shouldTriggerNextAlert: Bool
    let handler: ((ChainedAlertAction) -> Void)?
}
