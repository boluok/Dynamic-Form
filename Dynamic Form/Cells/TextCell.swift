//
//  TextCell.swift
//  Dynamic Form
//
//  Created by Bolu Okunaiya on 26/10/2019.
//  Copyright © 2019 Bolu Okunaiya. All rights reserved.
//

import Foundation
import UIKit

class TextCell: UITableViewCell {
      @IBOutlet weak var textField:UITextField?
       let datePicker = UIDatePicker()
    var element: Element? {
          didSet {
              textField?.placeholder = element?.label
            if(element?.type == "formattednumeric"){
                textField?.keyboardType = .phonePad
            }else if(element?.type == "datetime"){
              showDatePicker()
      
            }
          }
      }
    @objc func datePickerChanged(datePicker:UIDatePicker) {
   
           
        let dateFormatter = DateFormatter()
           
        dateFormatter.timeStyle = DateFormatter.Style.medium
           
        var strDate = dateFormatter.string(from: datePicker.date)
           
           textField?.text = strDate
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
     func showDatePicker(){
       //Formate Date
        datePicker.datePickerMode = .date

        //ToolBar
       let toolbar = UIToolbar();
       toolbar.sizeToFit()

       //done button & cancel button
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.bordered, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.bordered, target: self, action: #selector(cancelDatePicker));
       toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

    // add toolbar to textField
        textField?.inputAccessoryView = toolbar
     // add datepicker to textField
        textField?.inputView = datePicker

       }

    @objc func donedatePicker(){
      //For date formate
       let formatter = DateFormatter()
       formatter.dateFormat = "dd/MM/yyyy"
        textField?.text = formatter.string(from: datePicker.date)
       //dismiss date picker dialog
        self.endEditing(true)

        }

    @objc func cancelDatePicker(){
           //cancel button dismiss datepicker dialog
            self.endEditing(true)
          }
       

           override func prepareForReuse() {
               super.prepareForReuse()
               
                textField?.placeholder  = nil
           }
        
}
