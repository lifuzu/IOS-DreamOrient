//
//  DODream.swift
//  StudyCreation
//
//  Created by Richard Lee on 7/22/14.
//  Copyright (c) 2014 weimed. All rights reserved.
//

import UIKit

class DODreamSet: NSObject {
    var dreamId: String?
    var dreamItem: DODreamItem?
    var dreamActor: DODreamActor?
    var dreamReviewers: DODreamReviewer[] = []
    var dreamComments: DODreamComment[] = []
    var dreamLogs: DODreamLog[] = []

    var dreamAttribute: UInt? // Enumeration: private or public?
    var dreamStatus: UInt? //Enumeration: created, ongoing, achieved, retrospected
    //var plan: DOPlanSet?
    
    init(){}
}
