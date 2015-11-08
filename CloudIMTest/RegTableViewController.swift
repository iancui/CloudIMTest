//
//  RegTableViewController.swift
//  CloudIMTest
//
//  Created by Ian on 15/10/25.
//  Copyright © 2015年 AppCode. All rights reserved.
//

import UIKit
import Validator

class RegTableViewController: UITableViewController {

    @IBOutlet weak var user: UITextBox!
    @IBOutlet weak var pass: UITextBox!
    @IBOutlet weak var mail: UITextBox!
    @IBOutlet weak var phoneNumber: UITextBox!
    @IBOutlet weak var question: UITextBox!
    @IBOutlet weak var answer: UITextBox!
    @IBOutlet var loginTextFields: [UITextField]!
    
    var possibleInputs:CheckInputs = []
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.hidden = false
        self.title = "新用户注册"
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        let doneBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "regDone")
        self.navigationItem.rightBarButtonItem = doneBarButtonItem
        self.navigationItem.rightBarButtonItem?.enabled = false
        validate()
        
        
        
    }
    func validate(){
        var userRules = ValidationRuleSet<String>()
   
        let userLengthRule = ValidationRuleLength(min: 5, max: 10, failureError: ValidationError(message: "用户名5-10位"))
        userRules.addRule(userLengthRule)
        self.user.validationRules = userRules
        
        self.user.validationHandler = { result in
            switch result {
            case .Valid:
                self.user.highlightState = .Default
                self.possibleInputs.unionInPlace(CheckInputs.user)
            case .Invalid(let errors):
                self.user.highlightState = UITextBoxHighlightState.Wrong((errors.first?.message)!)
                self.possibleInputs.subtractInPlace(CheckInputs.user)
            }
            
            self.navigationItem.rightBarButtonItem?.enabled = self.possibleInputs.isAllOk()

        }
        
        user.validateOnInputChange(true)

        // 密码校验
        var passwordRules = ValidationRuleSet<String>()
        
        let minLengthRule = ValidationRuleLength(min: 5, failureError: ValidationError(message: "密码最短5位"))
        passwordRules.addRule(minLengthRule)
        
        let digitRule = ValidationRulePattern(pattern: "([a-zA-Z0-9]).{8,30}", failureError: ValidationError(message: "密码过于简单"))
        passwordRules.addRule(digitRule)
        
        self.pass.validationRules = passwordRules
        self.pass.validationHandler = { result in
            switch result {
            case .Valid:
                self.pass.highlightState = .Default
                self.possibleInputs.unionInPlace(CheckInputs.pass)
            case .Invalid(let errors):
                self.pass.highlightState = UITextBoxHighlightState.Wrong((errors.first?.message)!)
                self.possibleInputs.subtractInPlace(CheckInputs.pass)

                
            }
            
            self.navigationItem.rightBarButtonItem?.enabled = self.possibleInputs.isAllOk()

        }
        self.pass.validateOnInputChange(true)
        
        var emailRules = ValidationRuleSet<String>()
        let emailRule = ValidationRulePattern(pattern: .EmailAddress, failureError: ValidationError(message: "邮箱错误"))
        emailRules.addRule(emailRule)
        self.mail.validationRules = emailRules
        self.mail.validateOnInputChange(true)
        self.mail.validationHandler = { result in
            switch result {
            case .Valid:
                self.mail.highlightState = .Default
                self.possibleInputs.unionInPlace(CheckInputs.email)
            case .Invalid(let errors):
                self.mail.highlightState = UITextBoxHighlightState.Wrong((errors.first?.message)!)
                self.possibleInputs.subtractInPlace(CheckInputs.email)
            }
            self.navigationItem.rightBarButtonItem?.enabled = self.possibleInputs.isAllOk()
        }
        
        

    }
    
    

    func regDone(){
        // 注册新用户
        // 显示一个载入提示
        self.pleaseWait()
        // 建立一个用户的AVObject
//        let user = AVObject(className: "CuiUser")
        let user = AVUser()

        // 把输入个文本框的值，设置到对象中
        user.username = self.user.text
        user.password = self.pass.text
        user.email = self.mail.text
        user.mobilePhoneNumber = self.phoneNumber.text
        user["question"] = self.question.text
        user["answer"] = self.answer.text
        
        user.signUpInBackgroundWithBlock{ (succeeded, error) -> Void in
            self.clearAllNotice()
            if succeeded {
                self.successNotice("注册成功")
                self.navigationController?.popViewControllerAnimated(true)
            }else{
                print(user)
                print(error)
//                self.errorNotice(error)
                self.user.becomeFirstResponder()
                self.navigationItem.rightBarButtonItem?.enabled = false

            }

        }
        
        
//        // 查询是否已经存在用户
//        let query = AVQuery(className: "CuiUser")
//        query.whereKey("user", equalTo: self.user.text)
//        
//        query.getFirstObjectInBackgroundWithBlock { (existedUser, error) -> Void in
//            self.clearAllNotice()
//            if existedUser != nil {
//                self.errorNotice("用户已注册")
//                self.user.becomeFirstResponder()
//                self.navigationItem.rightBarButtonItem?.enabled = false
//            }else{
//                user.saveInBackgroundWithBlock({ (succeed, e) -> Void in
//                    if succeed {
//                        self.successNotice("注册成功")
//                        self.navigationController?.popViewControllerAnimated(true)
//                    }else{
//                        self.errorNotice("注册失败")
//                    }
//                })
//            }
//        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 3
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
