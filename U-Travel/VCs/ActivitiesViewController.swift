//
//  ActivitiesViewController.swift
//  U-Travel
//
//  Created by Ashley Yoon on 4/25/22.
//

import UIKit

class ActivitiesViewController: UIViewController {

    @IBOutlet weak var activityPicker: UIPickerView!
    var activityPickerData: [String] = [String]()
    
    @IBAction func SurveyBudget(_ sender: Any) {
        self.performSegue(withIdentifier: "survey_budget", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityPicker.delegate = self
        activityPicker.dataSource = self
        
        activityPickerData = ["Backpacking", "Biking", "Boating", "Rock Climbing", "Scuba Diving", "Sightseeing", "Skiing", "Swimming"]
    }
}

extension ActivitiesViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activityPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activityPickerData[row]
    }
}
