//
//  DODreamItemViewController.swift
//  StudyCreation
//
//  Created by Richard Lee on 7/24/14.
//  Copyright (c) 2014 Weimed LLC (weimed.com). All rights reserved.
//

import UIKit

class DODreamItemViewController: UIViewController {

    var dreamItem : DODreamItem?
    
    @IBOutlet var textDreamSubject : UITextField = nil
    @IBOutlet var textDreamRequiredCredits : UITextField = nil
    @IBOutlet var doneButton : UIBarButtonItem = nil

//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        if (!self.textDreamSubject.text.isEmpty && !self.textDreamRequiredCredits.text.isEmpty) {
            self.dreamItem = DODreamItem(itemSubject: self.textDreamSubject.text, requiredCredits: self.textDreamRequiredCredits.text.toInt()!)
        }
    }

}
