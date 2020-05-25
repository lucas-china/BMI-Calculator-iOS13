//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func updateHeight(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f", sender.value) + " m"
    }
    
    @IBAction func updateWeigth(_ sender: UISlider) {
        weightLabel.text = String(format: "%.2f", sender.value) + " Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "goToResultSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResultSegue" {
            guard let resultVC = segue.destination as? ResultViewController
                else { return }
            
            resultVC.bmi = calculatorBrain.getBMIValue()
            resultVC.advice = calculatorBrain.getAdvice()
            resultVC.color = calculatorBrain.getColor()
        }
    }
    
}

