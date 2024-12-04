//
//  ViewController.swift
//  Bulleyes
//
//  Created by Mobile Apps on 11/21/24.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 50
    var targetValue = 0
    var score = 0
    var round = 0

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }

    //Shows a pop-up alert message when the HIT ME button is pressed
    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        
        let points = 100 - difference
        
        score += points

        let message =
        "You scored \(points) points."

        let alert = UIAlertController(
            title: "Hello World",
            message: message,
            preferredStyle: .alert)

        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)

        alert.addAction(action)

        present(alert, animated: true, completion: nil)

        startNewRound()
    }

    // Updates the values of the slider when if is changed.
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = Int(slider.value)
    }

    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }

    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    @IBAction func startOver() {
        startNewGame()
    }
}
