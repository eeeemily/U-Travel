//
//  AccommodationViewController.swift
//  U-Travel
//
//  Created by Ashley Yoon on 4/25/22.
//

import UIKit

class AccommodationViewController: UIViewController {
    
    @IBAction func SurveyWeather(_ sender: Any) {
        self.performSegue(withIdentifier: "survey_weather", sender: self)
    }
    
    @IBAction func SurveyActivities(_ sender: Any) {
        self.performSegue(withIdentifier: "survey_activities", sender: self)
    }
    
    @IBOutlet weak var accPicker: UIPickerView!
    var accPickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accPicker.delegate = self
        accPicker.dataSource = self
        
        accPickerData = ["Apartments", "Bed & Breakfasts", "Homestays", "Hotels", "Motels"]
    }
}

extension AccommodationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return accPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return accPickerData[row]
    }
}
