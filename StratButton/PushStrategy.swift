//
//  PushStrategy.swift
//  StratButton
//
//  Created by Nikolas Omelianov on 5/27/19.
//  Copyright © 2019 Nikolas Omelianov. All rights reserved.
//

import Foundation

class PushStrategy: StrategyVC {
    func presentVC(vc: ViewController){
        vc.navigationController?.pushViewController(ViewController(), animated: true)
        

    }
}
