//
//  BaseViewModel.swift
//  Dynamic Form
//
//  Created by Bolu Okunaiya on 25/10/2019.
//  Copyright © 2019 Bolu Okunaiya. All rights reserved.
//

import Foundation

class BaseViewModel {
    
    
    var error: String? {
        didSet { self.showAlertClosure?() }
    }
    var isLoading: Bool = false {
        didSet { self.updateLoadingStatus?() }
    }
    
    
    // MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var didFinishFetch: (() -> ())?
    
    // MARK: - Constructor
//    init(dataService: DataService) {
//        self.dataService = dataService
//    }
}
