//
//  FormViewModel.swift
//  Dynamic Form
//
//  Created by Bolu Okunaiya on 25/10/2019.
//  Copyright © 2019 Bolu Okunaiya. All rights reserved.
//

import Foundation
import UIKit

enum FormViewModelElementType{
    case embeddedPhoto
    case text
    case formattedNumeric
    case dateTime
    case yesNo
    case button
}

func getFormElementType(type:String) -> FormViewModelElementType{
    switch type {
    case "embeddedphoto":
        return FormViewModelElementType.embeddedPhoto
    case "text":
          return FormViewModelElementType.text
        case "formattednumeric":
         return FormViewModelElementType.formattedNumeric
        case "datetime":
              return FormViewModelElementType.dateTime
          case "yesno":
                return FormViewModelElementType.yesNo
              case "button":
               return FormViewModelElementType.button
    default:
         return FormViewModelElementType.text
    }
}
protocol FormViewModelItem {
    var pageTitle: String { get }
    var page:Page { get }
    var sections:[Section]{get}
    var noOfSectionInPage:Int {get}


}

class FormViewModelItemImpl: FormViewModelItem {
    
    var sections: [Section] {
        return page.sections!
    }

  
    var pageTitle: String {
        return page.label!
    }
    var noOfSectionInPage: Int {
        return page.sections!.count
    }
  
    var page:Page
    
    init(page: Page) {
        self.page = page
        addButtonToLastSection(sections: self.page.sections ?? [])
    }
}

func addButtonToLastSection(sections:[Section]){
    let newElement = Element(type: "button", file: "", uniqueID: "", rules: nil, label: "Done", isMandatory: true, keyboard: "", formattedNumeric: "", mode: "")
    var section = sections.last!
    section.elements += [newElement]
   
}
extension FormViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return item.noOfSectionInPage
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.sections[section].elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let element = item.sections[indexPath.section].elements[indexPath.row]
        let type = getFormElementType(type: element.type)
        switch type {
        case .embeddedPhoto:
            if let cell = tableView.dequeueReusableCell(withIdentifier: EmbeddedPhotoCell.identifier, for: indexPath) as? EmbeddedPhotoCell {
                cell.element = element
                return cell
            }
        case .text:
                  if let cell = tableView.dequeueReusableCell(withIdentifier: TextCell.identifier, for: indexPath) as? TextCell {
                      cell.element = element
                      return cell
                  }
            case .formattedNumeric:
                      if let cell = tableView.dequeueReusableCell(withIdentifier: TextCell.identifier, for: indexPath) as? TextCell {
                          cell.element = element
                          return cell
                      }
        case .dateTime:
            if let cell = tableView.dequeueReusableCell(withIdentifier: TextCell.identifier, for: indexPath) as? TextCell {
                                    cell.element = element
                                    return cell
                                }
        default:
            print("Error")
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return item.sections[section].label
    }
}


class FormViewModel: NSObject {
    var item: FormViewModelItem
    
     init(pageNumber:Int) {
        let data = dataFromFile("pet_adoption")!
        let formData = FormData(data: data)!
        self.item = FormViewModelItemImpl(page: formData.form!.pages![pageNumber])
        super.init()
      
    }
    
}
