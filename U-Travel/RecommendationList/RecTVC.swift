//
//  RecTVC.swift
//  U-Travel
//
//  Created by Zheng, Minghui on 4/23/22.
//

// tvc swipe action: https://programmingwithswift.com/uitableviewcell-swipe-actions-with-swift/

import Foundation
import UIKit

class RecTVC: UITableViewController {

    let rc = RecCell()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
    }

    
    override func viewDidAppear(_ animated: Bool) {
        let alert = UIAlertController(title: "Welcome to Fish App!", message: "You can learn about fishes here!🐟", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated:  true)
        
    }

//    override func tableView(_ tableView: UITableView,
//                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let action = UIContextualAction(style: .normal,
//                                        title: "Favourite") { [weak self] (action, view, completionHandler) in
//                                            self?.handleMarkAsFavourite()
//                                            completionHandler(true)
//        }
//        action.backgroundColor = .systemBlue
//        return UISwipeActionsConfiguration(actions: [action])
//
//    }
    override func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }

    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecCell") as? RecCell else {
            fatalError("Expected RecCell")
        }
        cell.backgroundColor = UIColor(named: "PrimaryColor")

        cell.update(name: "Santorini")
        
//        cell.update(name: fishInfo.fishs[indexPath.row].name, protein: fishInfo.fishs[indexPath.row].protein , quote: fishInfo.fishs[indexPath.row].quote, fisheries: fishInfo.fishs[indexPath.row].fisheries, pic: fishInfo.fishs[indexPath.row].pic)

        return cell
    }
}
