//
//  ViewController.swift
//  U-Travel
//
//  Created by Zheng, Minghui on 4/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func SignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "sign_up", sender: self)
    }
    
    @IBAction func BackHome(_ sender: Any) {
        self.performSegue(withIdentifier: "back_home", sender: self)
    }
    
    @IBAction func CreateAccount(_ sender: Any) {
        self.performSegue(withIdentifier: "survey_intro", sender: self)
    }
    
    @IBAction func SurveyWeather(_ sender: Any) {
        self.performSegue(withIdentifier: "survey_weather", sender: self)
    }
    
    @IBAction func SurveyAcc(_ sender: Any) {
        self.performSegue(withIdentifier: "survey_accom", sender: self)
    }
    
    @IBAction func SurveyActivities(_ sender: Any) {
        self.performSegue(withIdentifier: "survey_activities", sender: self)
    }
    
    @IBAction func SurveyBudget(_ sender: Any) {
        self.performSegue(withIdentifier: "survey_budget", sender: self)
    }
    
    @IBAction func SurveyDates(_ sender: Any) {
        self.performSegue(withIdentifier: "survey_dates", sender: self)
    }
    
    @IBAction func SignUpToFeed(_ sender: Any) {
        self.performSegue(withIdentifier: "sign_up_to_feed", sender: self)
    }
    
    @IBAction func LogIn(_ sender: Any) {
        self.performSegue(withIdentifier: "log_in", sender: self)
    }
    
    @IBAction func LogInToFeed(_ sender: Any) {
        self.performSegue(withIdentifier: "log_in_to_feed", sender: self)
    }

    @IBAction func CreateGroup(_ sender: Any) {
        self.performSegue(withIdentifier: "add_people", sender: self)
    }
    
    @IBAction func NameGroup(_ sender: Any) {
        self.performSegue(withIdentifier: "gc_name", sender: self)
    }
    
    @IBAction func GroupChat(_ sender: Any) {
        self.performSegue(withIdentifier: "gc_main_chat", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

