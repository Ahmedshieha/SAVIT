//
//  MoreTableViewCell.swift
//  SAVIT
//
//  Created by Reda on 11/02/2021.
//  Copyright © 2021 Reda. All rights reserved.
//

import UIKit

class MoreTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    @IBOutlet weak var buttonName: UIButton!
    
    @IBOutlet weak var imageCell: UIImageView!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func buttonCell(_ sender: UIButton) {
        print("button")
    }
    
    func configureCell (image:UIImage ,buttonTitle:String ) {
        imageCell.image = image
        buttonName.setTitle(buttonTitle, for: .normal)
        
        
    }
    
    
    
}
