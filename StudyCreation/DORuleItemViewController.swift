//
//  DOAddRuleItemViewController.swift
//  StudyCreation
//
//  Created by Richard Lee on 7/17/14.
//  Copyright (c) 2014 weimed. All rights reserved.
//

import UIKit

class DORuleItemViewController: UIViewController {
    
    var ruleItem: DORuleItem?
    var ruleName: String = ""
    
    @IBOutlet var textField : UITextField = nil
    @IBOutlet var doneButton : UIBarButtonItem = nil
    
    /*init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }*/

    override func viewDidLoad() {
        super.viewDidLoad()
        // when enter as edit mode, rule name should be passed in
        textField.text = ruleName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if (sender as? UIButton == self.doneButton) {return}
        if (!self.textField.text.isEmpty) {
            self.ruleItem = DORuleItem(itemName: self.textField.text, itemCredit: 0)
        }
    }

}
