//
//  ButtonCell.swift
//  Dynamic Form
//
//  Created by Bolu Okunaiya on 26/10/2019.
//  Copyright © 2019 Bolu Okunaiya. All rights reserved.
//

import Foundation
import UIKit

class ButtonCell: UITableViewCell {
    @IBOutlet weak var button:UIButton?
    
    var action:String?{
        didSet{
            if(action == "done"){
               button?.setTitle("Done", for: .normal)
            }else{
                button?.setTitle("Next", for: .normal)
            }
        }
    }
    
     static var nib:UINib {
            return UINib(nibName: identifier, bundle: nil)
        }
        
        static var identifier: String {
            return String(describing: self)
        }
        override func awakeFromNib() {
               super.awakeFromNib()
               
        
    //           pictureImageView?.clipsToBounds = true
    //        pictureImageView?.contentMode = .scaleToFill
               
           }

           override func prepareForReuse() {
               super.prepareForReuse()
               
          
           }
    
}
