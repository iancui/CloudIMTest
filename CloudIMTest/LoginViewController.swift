//
//  LoginViewController.swift
//  CloudIMTest
//
//  Created by Ian on 15/10/25.
//  Copyright © 2015年 AppCode. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController ,RCAnimatedImagesViewDelegate {


    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var wallPaperImageView: RCAnimatedImagesView!
    @IBOutlet weak var loginStackView: UIStackView!
    @IBAction func login(sender: AnyObject) {
        
        if signin() {
     
            self.performSegueWithIdentifier("toConversationListSegue", sender: self)
        }
        
        
    }
    
    func signin() -> Bool {
        AVUser.logInWithUsernameInBackground(self.username.text, password: self.password.text) { (user, e) -> Void in
            if user != nil{
                
            } else {
            
            }
        }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        self.wallPaperImageView.delegate = self
        self.wallPaperImageView.startAnimating()
        
        
        
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        

        self.view.endEditing(true)

    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        UIView.animateWithDuration(0.7) { () -> Void in
            self.loginStackView.axis = .Vertical
        }
        
        
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        self.loginStackView.axis = .Horizontal
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animatedImagesNumberOfImages(animatedImagesView: RCAnimatedImagesView!) -> UInt {
        return 3
    }
    
    func animatedImagesView(animatedImagesView: RCAnimatedImagesView!, imageAtIndex index: UInt) -> UIImage! {
        return UIImage(named: "wall\(index + 1)")
    }
//    
//    func animatedImagesNumberOfImages(animatedImagesView: JSAnimatedImagesView!) -> UInt {
//        return 3
//    }
//    
//    func animatedImagesView(animatedImagesView: JSAnimatedImagesView!, imageAtIndex index: UInt) -> UIImage! {
//        return UIImage(named: "wall\(index + 1)")
//    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
