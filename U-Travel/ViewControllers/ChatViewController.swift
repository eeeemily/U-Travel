//
//  ChatViewController.swift
//  U-Travel
//
//  Created by Ashley Yoon on 4/24/22.
//

import UIKit

class ChatViewController: UIViewController {

    @IBAction func newGC(_ sender: Any) {
//        let vc=NewChatViewController()
        let storyboard=UIStoryboard(name: "Main", bundle: nil)
        let vc=storyboard.instantiateViewController(identifier: "GCAdd")
        
//        vc.completion = { [weak self] result in
//            print("\(result)")
//            self?.createNewConversation(result: result)
//        }
        
//        vc.navigationItem.largeTitleDisplayMode = .never
//        self.navigationController?.pushViewController(vc, animated: true)

        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: false)
//        self.performSegue(withIdentifier: "gc_add_people", sender: self)
    }
    
    private func createNewConversation(result: [String: String]) {
        guard let name = result["name"],
              let email = result["email"] else {
            return
        }
        let vc=IndivChatViewController(with: email)
        vc.isNewConversation = true
        vc.title = name
        vc.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet weak var ChatList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChatList.isHidden = true
        setupTableView()
        fetchConversations()
    }
    
    private func fetchConversations() {
        ChatList.isHidden = false
    }
    
    private func setupTableView() {
        ChatList.delegate = self
        ChatList.dataSource = self
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        let isLoggedIn=UserDefaults.standard.bool(forKey: "logged_in")
//        
//        if !isLoggedIn {
//            let vc=LoginViewController()
//            let nav=UINavigationController(rootViewController: vc)
//            nav.modalPresentationStyle = .fullScreen
//            present(nav, animated: false)
//        }
//    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=ChatList.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Hello World"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ChatList.deselectRow(at: indexPath, animated: true)
        
//        self.performSegue(withIdentifier: "existing_chat", sender: self)
//
        let vc=IndivChatViewController(with: "test@gmail.com")
        vc.title = "Jenny Smith"
        vc.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
