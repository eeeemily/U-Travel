//
//  FriendsFeedViewController.swift
//  U-Travel
//
//  Created by Zheng, Minghui on 4/24/22.
//

import UIKit

class FriendsFeedViewController: UIViewController {
    let feedType = ["Your friends have recently been to...", "Places in your bucket list that are on sale", "Friends from High School Squad saved...", "Friends from UR saved..."]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

extension FriendsFeedViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as? FriendsFeedTableViewCell else {
            fatalError("Unable to create friends feed table view cell")
        }
        cell.feedTypeLabel.text = feedType[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}
