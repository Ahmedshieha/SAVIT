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
    var lableName : [String] = ["Records","Depts","Loans","Group Sharing","Setting","Terms & Conditions","Log Out"]
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        showCell()
    }
    
    private func showCell () {
        let cellNib = UINib(nibName: "MoreTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "MoreTableViewCell")
    }

}


extension MoreViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height / 7
//        return 70
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.frame.size.height/7
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lableName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell") as! MoreTableViewCell
        cell.configureCell(image: logoImages[indexPath.row], cellTitle: lableName[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(lableName[indexPath.row])
    }
    
    
}

