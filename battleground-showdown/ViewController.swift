//
//  ViewController.swift
//  battleground-showdown
//
//  Created by Kevin Gilboy on 11/9/15.
//  Copyright © 2015 Kevin Gilboy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Properties
    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var playerHpLbl: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var enemyHpLbl: UILabel!
    @IBOutlet weak var chestBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        player = Player(name: "Dirty Noob", hp: 110, attackPwr: 20)
        generateRandomEnemy()
        playerHpLbl.text = "\(player.hp) HP"
        
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
        } else {
            enemy = Devil(startingHp: 60, attackPwr:  15)
        }
        
        enemyImg.hidden = false
    }
    
    @IBAction func onChestTapped(sender: AnyObject) {
        chestBtn.hidden = true
        printLbl.text = chestMessage
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }
    
    @IBAction func attackTapped(sender: AnyObject) {
        if enemy.attemptAttack(player.attackPwr){
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)"
            chestBtn.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            enemyImg.hidden = true
        }
        
    }
    
}

