//
//  ChainedAlertTree.swift
//  ChainedAlertController
//
//  Created by Said Ozcan on 13/06/2018.
//  Copyright © 2018 Said Ozcan. All rights reserved.
//

import Foundation

indirect enum ChainedAlertTree {
    case alert(alert: ChainedAlert, nextAlert: ChainedAlertTree?)
}
