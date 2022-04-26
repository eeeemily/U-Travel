//
//  NewChatViewController.swift
//  U-Travel
//
//  Created by Ashley Yoon on 4/24/22.
//

import UIKit

class NewChatViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var friendChatList: UITableView!
    
    private var users = [[String: String]]()
    private var results = [[String: String]]()
    public var completion: (([String: String]) -> (Void))?
    private var hasFetched = false
    
    @IBAction func back(_ sender: Any) {
        self.performSegue(withIdentifier: "back_to_gc", sender: self)
    }
    
    @IBAction func backAdd(_ sender: Any) {
        self.performSegue(withIdentifier: "back_to_add", sender: self)
    }
    
    @IBAction func toGCPic(_ sender: Any) {
        self.performSegue(withIdentifier: "gc_name", sender: self)
    }
    
    @IBAction func toNewGC(_ sender: Any) {
        self.performSegue(withIdentifier: "to_new_gc", sender: self)
    }
    
//    private let search: UISearchBar = {
//        let search = UISearchBar()
//        search.placeholder = "testing..."
//        return search
//    }()
//    
//    private let tableView: UITableView = {
//        let table = UITableView()
//        table.isHidden = true
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        return table
//    }()
    
    private let noResultsLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = "No Results"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 21, weight: .medium)
        return label
    }()
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
//        view.backgroundColor = .white
//        search.delegate = self
//        navigationController?.navigationBar.topItem?.titleView = search
        
        friendChatList.isHidden = true
        view.addSubview(noResultsLabel)

        friendChatList.delegate = self
        friendChatList.dataSource = self
        searchBar.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        noResultsLabel.frame = CGRect(x: view.frame.width/4,
                                      y: (view.frame.height-200)/2,
                                      width: view.frame.width/2,
                                      height: 200)
    }
}

extension NewChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = friendChatList.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = results[indexPath.row]["name"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let targetUserData = results[indexPath.row]
//        dismiss(animated: true, completion: { [weak self] in
//            self?.completion?(targetUserData)
//        })
//        completion?(targetUserData)
    }
}

extension NewChatViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text=searchBar.text, !text.replacingOccurrences(of: " ", with: "").isEmpty else {
            return
        }
        searchBar.resignFirstResponder()
        results.removeAll()
        self.searchUsers(query: text)
    }
    
    func searchUsers(query: String) {
        if hasFetched {
            filterUsers(with: query)
        } else {
            DatabaseManager.shared.getAllUsers(completion: { [weak self] result in
                switch result {
                case .success(let usersCollection):
                    self?.hasFetched = true
                    self?.users = usersCollection
                    self?.filterUsers(with: query)
                case .failure(let error):
                    print("Failed to get users: \(error)")
                }
            })
        }
    }
    
    func filterUsers(with term: String) {
        guard hasFetched else {
            return
        }
        
        let results: [[String: String]] = self.users.filter({
            guard let name = $0["name"]?.lowercased() else {
                return false
            }
            return name.hasPrefix(term.lowercased())
        })
        self.results = results
        updateUI()
    }
    
    func updateUI() {
        if results.isEmpty {
            self.noResultsLabel.isHidden = false
            self.friendChatList.isHidden = true
        } else {
            self.noResultsLabel.isHidden = true
            self.friendChatList.isHidden = false
            self.friendChatList.reloadData()
        }
    }
}
