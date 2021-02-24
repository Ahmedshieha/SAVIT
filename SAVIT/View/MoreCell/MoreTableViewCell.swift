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
    
    
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var lable: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func configureCell (image:UIImage ,cellTitle:String ) {
        imageCell.image = image
        lable.text! = cellTitle
    
    }
    
    
    
}
