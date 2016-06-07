//
//  ViewController.swift
//  War!
//
//  Created by Steve Cox on 6/7/16.
//  Copyright © 2016 SteveCox. All rights reserved.
//

import UIKit

class WarViewController: UIViewController {

    @IBOutlet weak var playerCardImageView: UIImageView!
    
    
    @IBOutlet weak var computerCardImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func playGameButtonTapped(sender: AnyObject) {
        //Step 1 = call the playgame function so that we can get a winnner & a loser
        GameController.playGame { (winner, playerCard, computerCard) in
        //Step 2 = Update the imageViews with the images
            ImageController.imageForURL(playerCard.imageURLString, completion: { (image) in
                self.playerCardImageView.image = image
            })
            ImageController.imageForURL(computerCard.imageURLString, completion: { (image) in
                self.computerCardImageView.image = image
            })
        }
    }
}

