//
//  LoginViewController.swift
//  CloudIMTest
//
//  Created by Ian on 15/10/25.
//  Copyright © 2015年 AppCode. All rights reserved.
//

import UIKit

//extension UIView {
//    @IBInspectable var cornerRadius:CGFloat{
//        get {
//            return layer.cornerRadius
//        }
//        
//        set{
//            layer.cornerRadius = newValue
//            layer.masksToBounds = (newValue>0)
//        }
//    }
//}

class LoginViewController: UIViewController ,JSAnimatedImagesViewDataSource {

    @IBOutlet weak var wallPaperImageView: JSAnimatedImagesView!
    @IBOutlet weak var loginStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.wallPaperImageView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1) { () -> Void in
            self.loginStackView.axis = .Vertical
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animatedImagesNumberOfImages(animatedImagesView: JSAnimatedImagesView!) -> UInt {
        return 3
    }
    
    func animatedImagesView(animatedImagesView: JSAnimatedImagesView!, imageAtIndex index: UInt) -> UIImage! {
        return UIImage(named: "wall\(index + 1)")
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
