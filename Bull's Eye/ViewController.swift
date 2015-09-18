//
//  ViewController.swift
//  Bull's Eye
//
//  Created by mac on 15/9/14.
//  Copyright © 2015年 mac. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    var currentValue: Int = 50
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0
    var points: Int = 0
    
    @IBOutlet weak var slider: UISlider?
    @IBOutlet weak var targetLabel: UILabel?
    @IBOutlet weak var scoreLabel: UILabel?
    @IBOutlet weak var roundLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        updateLables()
        /*let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: UIControlState.Normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: UIControlState.Highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizable = trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: UIControlState.Normal)
        }
        
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: UIControlState.Normal)
        }
        // Do any additional setup after loading the view, typically from a nib.*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func  showAlert() {
        let difference = abs(currentValue - targetValue)
        points = 100 - difference
        
        var title: String
        if difference == 0 {
            title = "Perfect!"
            points = points + 100
        }else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points = points + 50
            }
        }else {
            title = "Not even close..."
        }
        
        let message = "You scored \(points) points"

        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) in
            self.startNewRound()
            self.updateLables()
        }))
        presentViewController(alert, animated: true, completion: nil)

        
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        self.currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        targetValue = Int(arc4random_uniform(100)) + 1
        currentValue = 50
        slider?.value = Float(currentValue)
        round = round + 1
        score = score + points
    }
    
    func updateLables() {
        targetLabel?.text = "\(targetValue)"
        scoreLabel?.text = "\(score)"
        roundLabel?.text = "\(round)"
    }
    
    @IBAction func startOver() {
        startNewGame()
        updateLables()
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        view.layer.addAnimation(transition, forKey: nil)
    }
    
    func startNewGame() {
        score = 0
        round = 0
        points = 0
        startNewRound()
    }

}

