//
//  DORuleItem.swift
//  StudyCreation
//
//  Created by Richard Lee on 7/17/14.
//  Copyright (c) 2014 weimed. All rights reserved.
//

import UIKit

class DORuleItem: NSObject {
    var itemName: String?
    var itemDescription: String?
    var itemCredit: Int?
    
    init(itemName: String!, itemCredit: Int!, itemDescription: String = ""){
        self.itemName = itemName
        self.itemCredit = itemCredit
        self.itemDescription = itemDescription
    }
}
