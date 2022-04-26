//
//  UserProfileViewController.swift
//  U-Travel
//
//  Created by Ashley Yoon on 4/24/22.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet weak var userProfile: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        userProfile.isUserInteractionEnabled = true
        userProfile.layer.masksToBounds = true
        userProfile.layer.cornerRadius = userProfile.frame.width/2.0
        userProfile.layer.borderWidth = 17

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

extension UserProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

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
