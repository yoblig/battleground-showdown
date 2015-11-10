//
//  Devil.swift
//  battleground-showdown
//
//  Created by Kevin Gilboy on 11/9/15.
//  Copyright © 2015 Kevin Gilboy. All rights reserved.
//

import Foundation

class Devil: Enemy {
    override var loot: [String] {
        return ["Magic Wand", "Salted Pork", "Dark Amulet"]
    }
    
    override var type: String {
        return "Devil"
    }
}