//
//  Player.swift
//  battleground-showdown
//
//  Created by Kevin Gilboy on 11/9/15.
//  Copyright © 2015 Kevin Gilboy. All rights reserved.
//

import Foundation

class Player : Character {
    
    private var _name = "Player"
    private var _inventory = [String]()
    
    var name: String {
        get {
            return _name
        }
    }
    
    var inventory : [String] {
        get {
            return _inventory
        }
    }
    
    func addItemToInventory (item:String) {
        _inventory.append(item)
    }
        
    convenience init(name:String, hp: Int, attackPwr: Int){
        self.init(startingHp: hp, attackPwr: attackPwr)
        self._name = name
    }
    
}