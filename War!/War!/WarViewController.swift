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
        
            // STEP 4 = create a variable that holds the game result text for use in alert controller
            var resultText = ""
                   if winner == .Player {
                resultText = "You Win!"
            } else if winner == .Computer {
                resultText = "You Lose!"
            } else {
                resultText = "Tie Game!"
            }
            
            // STEP 9 - put the alert creation and presentation back on the Main Queue
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            // STEP 5 = create an alert to show game result
            
            let alert = UIAlertController(title: resultText, message: nil, preferredStyle: .Alert)
            
            // STEP 6 = create an action that allows alert dismissal
            
            let action = UIAlertAction(title: "I understand", style: .Cancel, handler: nil)
            
            // STEP 7 = add the action (or button) to the alert
            alert.addAction(action)
            
            // STEP 8 = present alert
            self.presentViewController(alert, animated: true, completion: nil)
            
        })
    }
}

}
