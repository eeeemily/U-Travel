//
//  RegisterViewController.swift
//  U-Travel
//
//  Created by Ashley Yoon on 4/24/22.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var signUpEmailField: UITextField!
    @IBOutlet weak var signUpPasswordField: UITextField!
    
    @IBAction func CreateAccount(_ sender: Any) {
        firstNameField.resignFirstResponder()
//       signUpPasswordField.resignFirstResponder()
        
        guard let firstName=firstNameField.text, let lastName=lastNameField.text, let email=signUpEmailField.text, let password=signUpPasswordField.text, !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty, !password.isEmpty, password.count >= 8 else {
            signupErrorAlert(message: "Please fill in all required information")
            return
        }
        
        //firebase register
        
        DatabaseManager.shared.userExists(with: email, completion: { [weak self] exists in guard let strongSelf = self else {
                return
            }

            guard !exists else {
                strongSelf.signupErrorAlert(message: "User already exists")
                return
            }
            
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {
                
                authResult, error in guard let strongSelf = self else { return
                    
                }
            
                guard authResult != nil, error == nil else {
                    print("Error adding user")
                    return
                }
            
    //            let user = result.user
    //            print("Created User: \(user)")
            
            let chatUser=AppUser(firstName: firstName, lastName: lastName, emailAddress: email)
            
            DatabaseManager.shared.insertUser(with: chatUser, completion: { success in
                if success {
                    guard let image = strongSelf.userProfile.image,
                          let data = image.pngData() else {
                        return
                    }
                    let fileName = chatUser.profilePicFileName
                    StorageManager.shared.uploadProfilePic(with: data, fileName: fileName, completion: { result in
                        switch result {
                        case .success(let downloadUrl):
                            UserDefaults.standard.set(downloadUrl, forKey: "profile_picture_url")
                            print(downloadUrl)
                        case .failure(let error):
                            print("Storage manager error: \(error)")
                        }
                    })
                }
            })
            
//            DatabaseManager.shared.insertUser(with: AppUser(firstName: firstName, lastName: lastName, emailAddress: email))
//
                strongSelf.performSegue(withIdentifier: "survey_intro", sender: self)
            })
        })
    }
    
    func signupErrorAlert(message: String) {
        let alert=UIAlertController(title: "Sign Up Failed", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    @IBOutlet weak var userProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        signUpEmailField.delegate = self
//        signUpPasswordField.delegate = self
        
        userProfile.isUserInteractionEnabled = true
        userProfile.layer.masksToBounds = true
        userProfile.layer.cornerRadius = userProfile.frame.width/2.0
        userProfile.layer.borderWidth = 10
        
        //MAKE SURE TO CHANGE COLOR FOR BORDER
        userProfile.layer.borderColor = UIColor.black.cgColor
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfile))
//        gesture.numberOfTouchesRequired = 1
        userProfile.addGestureRecognizer(gesture)
    }
    
    @objc private func didTapChangeProfile() {
        print("Changing profile pic")
        presentPhotoActionSheet()
    }
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(title: "Profile Picture", message: "How would you like to select a picture?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { [weak self] _ in self?.presentCamera() }))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { [weak self] _ in self?.presentPhotoPicker() }))
        
        present(actionSheet, animated: true)
    }
    
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage=info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        self.userProfile.image = selectedImage
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


//extension RegisterViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == signUpEmailField {
//            signUpPasswordField.becomeFirstResponder()
//        }
//        else if textField == signUpPasswordField {
//            CreateAccount(self)
//        }
//        return true
//    }
//}
