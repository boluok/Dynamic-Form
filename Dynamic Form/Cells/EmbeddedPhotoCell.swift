//
//  EmbeddedPhotoCell.swift
//  Dynamic Form
//
//  Created by Bolu Okunaiya on 26/10/2019.
//  Copyright © 2019 Bolu Okunaiya. All rights reserved.
//

import Foundation
import UIKit

class EmbeddedPhotoCell: UITableViewCell {
    @IBOutlet weak var pictureImageView: UIImageView?
    var element: Element? {
           didSet {
            pictureImageView?.downloaded(from: element?.file ?? "")
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
           
           pictureImageView?.image = nil
       }    
    
}
