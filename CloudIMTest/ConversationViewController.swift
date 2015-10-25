//
//  ConversationViewController.swift
//  CloudIMTest
//
//  Created by Ian on 15/10/22.
//  Copyright © 2015年 AppCode. All rights reserved.
//

import UIKit

class ConversationViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        loadUser()
        
    }
    func loadUser(){
        
        self.targetId = RCIMClient.sharedRCIMClient().currentUserInfo.userId
        let userName = RCIMClient.sharedRCIMClient().currentUserInfo.name
        
        self.userName = userName
        
        self.conversationType = .ConversationType_PRIVATE
        self.title = userName
        
        self.setMessageAvatarStyle(.USER_AVATAR_CYCLE)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
