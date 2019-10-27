//
//  ViewController.swift
//  Dynamic Form
//
//  Created by Bolu Okunaiya on 25/10/2019.
//  Copyright © 2019 Bolu Okunaiya. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    let viewModel = FormViewModel(pageNumber:0)
    @IBOutlet weak var tableView: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initTableView()
    }
    
    func initTableView()  {
        tableView?.dataSource = viewModel
        tableView?.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.register(EmbeddedPhotoCell.nib, forCellReuseIdentifier: EmbeddedPhotoCell.identifier)
        tableView?.register(TextCell.nib, forCellReuseIdentifier: TextCell.identifier)
    }
    
    


}

