//
//  DODreamItem.swift
//  StudyCreation
//
//  Created by Richard Lee on 7/18/14.
//  Copyright (c) 2014 Weimed LLC (weimed.com). All rights reserved.
//

import UIKit

class DODreamItem: NSObject {
    var itemSubject : String?
    var requiredCredits: Int?
    var currentCredits: Int = 0
    
    var itemSuggestedCredits: UInt?
    var itemStatus: UInt?
    //var itemSubject: String?
    var itemDescription: String?
    var itemImages: UIImage[]?
    //var itemAudios: UIVideo[]?
    //var itemVideos: UIVideo[]?
    //var itemUrls: NSURL[]?
    //var itemAgeRange: Range = 5...7
    var itemTags : String?
    var itemComments : DODreamComment[] = []
    
    init() {}
    init(itemSubject: String, requiredCredits: Int) {
        self.itemSubject = itemSubject
        self.requiredCredits = requiredCredits
        self.currentCredits = 0
    }
}
