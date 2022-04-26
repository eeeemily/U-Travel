//
//  DateViewController.swift
//  U-Travel
//
//  Created by Ashley Yoon on 4/25/22.
//

import UIKit

class DateViewController: UIViewController {

    @IBAction func startDate(_ sender: UIDatePicker) {
        print("START DATE IS \(sender.date)")
    }
    
    @IBAction func returnDate(_ sender: UIDatePicker) {
        print("RETURN DATE IS \(sender.date)")
    }
    
    @IBAction func SignUpToFeed(_ sender: Any) {
        self.performSegue(withIdentifier: "sign_up_to_feed", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
