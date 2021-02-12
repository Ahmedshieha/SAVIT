//
//  MoreViewController.swift
//  SAVIT
//
//  Created by Reda on 11/02/2021.
//  Copyright © 2021 Reda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
class MoreViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var logoImages : [UIImage] = [UIImage(named: "history-24px")!,UIImage(named: "payments-24px")!,UIImage(named:"card_giftcard-24px" )!,UIImage(named: "group-24px (1)")!,UIImage(named: "history-24px")!,UIImage(named: "history-24px")!,UIImage(named: "history-24px")!,UIImage(named: "history-24px")!]
    var buutonsName : [String] = ["Records","Depts","Loans","Group Sharing","Setting","Terms & Conditions","Log Out"]
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showCell()
    }
    
    private func showCell () {
        let cellNib = UINib(nibName: "MoreTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "MoreTableViewCell")
    }
    @IBAction func logOut(_ sender: Any) {
        let firebaseAuth = Auth.auth()
     do {
       try firebaseAuth.signOut()
     } catch let signOutError as NSError {
       print ("Error signing out: %@", signOutError)
     }
        print("yes")
    }
    

}


extension MoreViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell") as! MoreTableViewCell
        cell.configureCell(image: logoImages[indexPath.row], buttonTitle: buutonsName[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ahmed")
    }
    
    
}

