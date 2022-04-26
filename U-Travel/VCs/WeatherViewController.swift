//
//  WeatherViewController.swift
//  U-Travel
//
//  Created by Ashley Yoon on 4/25/22.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBAction func SurveyAcc(_ sender: Any) {
        self.performSegue(withIdentifier: "survey_accom", sender: self)
    }
    
    @IBOutlet weak var weatherPicker: UIPickerView!
    var weatherPickerData: [String] = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherPicker.delegate = self
        weatherPicker.dataSource = self
        
        weatherPickerData = ["Cloudy", "Rainy", "Snowy", "Sunny", "Windy"]
    }
}

extension WeatherViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return weatherPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return weatherPickerData[row]
    }
}
