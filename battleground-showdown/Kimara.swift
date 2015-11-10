//
//  Kimara.swift
//  battleground-showdown
//
//  Created by Kevin Gilboy on 11/9/15.
//  Copyright © 2015 Kevin Gilboy. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Tough Hide", "Kimara Venom"]
    }
    
    override var type :String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
    }
}