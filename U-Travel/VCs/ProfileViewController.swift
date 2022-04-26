//
//  ProfileViewController.swift
//  U-Travel
//
//  Created by Ashley Yoon on 4/24/22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userProfile: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userProfile.isUserInteractionEnabled = true
        userProfile.layer.masksToBounds = true
        userProfile.layer.cornerRadius = userProfile.frame.width/2.0
        userProfile.layer.borderWidth = 10
        
        //MAKE SURE TO CHANGE COLOR FOR BORDER
        userProfile.layer.borderColor = UIColor.black.cgColor
        
        guard let email=UserDefaults.standard.value(forKey: "email") as? String else {
            return
        }
        let safeEmail=DatabaseManager.safeEmail(email: email)
        let fileName=safeEmail+"_profile_picture.png"
        let path="images/"+fileName
        
        StorageManager.shared.downloadURL(for: path, completion: { [weak self] result in
            switch result {
            case .success(let url):
                self?.downloadImage(imageView: self!.userProfile, url: url)
            case .failure(let error):
                print("Failed to get download url: \(error)")
            }
        })
        
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfile))
//        userProfile.addGestureRecognizer(gesture)
    }
    
    func downloadImage(imageView: UIImageView, url: URL) {
        URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                let image=UIImage(data: data)
                self.userProfile.image=image
            }
        }).resume()
    }
}
