//
//  DORuleProtocol.swift
//  StudyCreation
//
//  Created by Richard Lee on 7/24/14.
//  Copyright (c) 2014 Weimed LLC (weimed.com). All rights reserved.
//

import Foundation
import CoreData

protocol RuleProtocol {
    var name: String? { get set }
    var credit: Int? { get set }
    var desc: String? { get set }
    var entityId: String? { get set }
    var createdAt: NSDate? { get set }
    var modifiedAt: NSDate? { get set }

    // class methods
    class func insertNewRuleInManagedObjectContext(managedObjectContext: NSManagedObjectContext!) -> RuleProtocol
    class func ruleFromRuleEntity(ruleEntity: NSManagedObject) -> RuleProtocol

    // instance methods
    func update(#name: String, credit: Int, desc: String)
    func deleteInManagedObjectContext(managedObjectContext: NSManagedObjectContext!)
}