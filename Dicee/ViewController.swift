//
//  ViewController.swift
//  Dicee
//
//  Created by Mehmet Sukru Kavak on 24.05.2018.
//  Copyright © 2018 Mehmet Sukru Kavak. All rights reserved.
//

import UIKit
import AudioToolbox
class ViewController: UIViewController {

    var randomDiceIdx1 : Int = 0;
    var randomDiceIdx2 : Int = 0;
    
    var diceArray = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDiceImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
       updateDiceImages()
    }
    
    func updateDiceImages(){
        randomDiceIdx1 = Int(arc4random_uniform(6))
        randomDiceIdx2 = Int(arc4random_uniform(6))
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIdx1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIdx2])
        if(randomDiceIdx1 == randomDiceIdx2){
              AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
       
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateDiceImages()
        
    }
    
}

