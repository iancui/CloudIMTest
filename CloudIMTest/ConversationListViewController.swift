//
//  ConversationListViewController.swift
//  CloudIMTest
//
//  Created by Ian on 15/10/22.
//  Copyright © 2015年 AppCode. All rights reserved.
//

import UIKit
import KxMenu

class ConversationListViewController: RCConversationListViewController {
    
 
    let conVC = RCConversationViewController()
    
    @IBAction func ShowMenu(sender: UIBarButtonItem) {
        var frame = sender.valueForKey("view")?.frame
        frame?.origin.y = (frame?.origin.y)! + 30
        
        
        let kxMenuItem = KxMenuItem()
        kxMenuItem.title = "扫一扫"
        kxMenuItem.image = UIImage(named: "group")
        kxMenuItem.target = self
        kxMenuItem.action = "QRcodeReader"
        KxMenu.showMenuInView(self.view, fromRect: frame!, menuItems: [
            KxMenuItem("客服",image: UIImage(named: "user"),target: self,action:"clickMenu"),
            KxMenuItem("好友",image: UIImage(named: "group"),target: self,action:"addNewMessage"),
            kxMenuItem
            
            ])
//        KxMenu.showMenuInView(self.view, fromRect: <#T##CGRect#>, menuItems: KxMenuItem())
        
//        let items = [
//            MenuItem(title: "客服", iconName: "group", glowColor: UIColor.redColor(), index: 0),
//            MenuItem(title: "与左耳聊天", iconName: "user", glowColor: UIColor.greenColor(), index: 1),
//            MenuItem(title: "通讯录", iconName: "conversation", glowColor: UIColor.orangeColor(), index: 2),
//            MenuItem(title: "关于", iconName: "message", glowColor: UIColor.grayColor(), index: 3)
//        ]
//        
//        let menu = PopMenu(frame: self.view.bounds, items: items)
//        
//        menu.menuAnimationType = .NetEase
//        if menu.isShowed {
//            return
//        }
//        menu.didSelectedItemCompletion = { (selectedItem: MenuItem!) -> Void in
//            print(selectedItem.index)
//        }
//        
//        menu.showMenuAtView(self.view)
        
    }
    
    func addNewMessage(){
        //代码跳转到会话界面
        let conVC = RCConversationViewController()
        
        conVC.targetId = "daiyan"
        conVC.userName = "左耳"
        conVC.conversationType = .ConversationType_PRIVATE
        
        conVC.title = "左耳"
        
        self.navigationController?.pushViewController(conVC, animated: true)
        
        self.tabBarController?.tabBar.hidden = true

    }
    
    func QRcodeReader(){
        self.performSegueWithIdentifier("toQRCodeReaderSegue", sender: self)
    }
    
    
    
    func clickMenu(){
        //代码跳转到会话界面
                let conVC = RCConversationViewController()
        
                conVC.targetId = "daiyan"
                conVC.userName = "左耳"
                conVC.conversationType = .ConversationType_PRIVATE
        
                conVC.title = "左耳"
        
                self.navigationController?.pushViewController(conVC, animated: true)
                
                self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let appDelegate = UIApplication.sharedApplication().delegate as!  AppDelegate
        
        appDelegate.connectServer { () -> Void in
            
            // 允许的会话类型
            self.setDisplayConversationTypes([
                RCConversationType.ConversationType_APPSERVICE.rawValue,
                RCConversationType.ConversationType_CHATROOM.rawValue,
                RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
                RCConversationType.ConversationType_DISCUSSION.rawValue,
                RCConversationType.ConversationType_GROUP.rawValue,
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
                RCConversationType.ConversationType_PUSHSERVICE.rawValue,
                RCConversationType.ConversationType_SYSTEM.rawValue
                ])
            self.refreshConversationTableViewIfNeeded()
        }
        
        self.tabBarController?.tabBar.tintColor = UIColor.greenColor()
        
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "tapOnCellSegue"{
        let destVC = segue.destinationViewController as! RCConversationViewController
        
        destVC.targetId = conVC.targetId
        destVC.userName = conVC.userName
        destVC.conversationType = conVC.conversationType
        destVC.title = conVC.title
        }
        
        self.tabBarController?.tabBar.hidden = true
        
        
    }
    
    override func onSelectedTableRow(conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, atIndexPath indexPath: NSIndexPath!) {
        //代码跳转到会话界面
//        let conVC = RCConversationViewController()
//        
//        conVC.targetId = model.targetId
//        conVC.userName = model.conversationTitle
//        conVC.conversationType = .ConversationType_PRIVATE
//        
//        conVC.title = model.conversationTitle
//        
//        self.navigationController?.pushViewController(conVC, animated: true)
//        
//        self.tabBarController?.tabBar.hidden = true
        
                conVC.targetId = model.targetId
                conVC.userName = model.conversationTitle
                conVC.conversationType = .ConversationType_PRIVATE
        
                conVC.title = model.conversationTitle
        
        self.performSegueWithIdentifier("tapOnCellSegue", sender: self)
        
    }
    

    
    

}
