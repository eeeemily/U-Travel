//
//  BudgetViewController.swift
//  U-Travel
//
//  Created by Ashley Yoon on 4/25/22.
//

import UIKit

class BudgetViewController: UIViewController {

    @IBOutlet weak var sliderVal: UILabel!
    
    @IBAction func slider(_ sender: UISlider) {
        let currVal = Int(sender.value)
        sliderVal.text="$\(currVal)"
    }
    
    @IBAction func SurveyDates(_ sender: Any) {
        self.performSegue(withIdentifier: "survey_dates", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
