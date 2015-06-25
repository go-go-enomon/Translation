
//
//  TextViewController.swift
//  Translation
//
//  Created by 榎本拓馬 on 2015/06/18.
//  Copyright (c) 2015年 榎本拓馬. All rights reserved.
//

import Foundation

import UIKit

// まず、デリゲートプロトコルを宣言
class TextViewController: UIViewController , UITextFieldDelegate {
    
    // テキストフィールドをアウトレット接続して
    @IBOutlet var text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // selfをデリゲートにする
        self.text.delegate = self
     }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /// 画面遷移時に渡す為の値
    var _param:String = "segue OK"
    
    @IBOutlet var myButton : UIButton!
    
    /**
    画面遷移ボタン
    */@IBAction func myButton(sender: AnyObject) {
        performSegueWithIdentifier("segue",sender: nil)
    }
    /**
    画面遷移時に値を遷移先に渡す
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segue") {
            // SecondViewControllerクラスをインスタンス化してsegue（画面遷移）で値を渡せるようにバンドルする
            var resultView : ResultViewController = segue.destinationViewController as ResultiewController
            // resultView（バンドルされた変数）に受け取り用の変数を引数とし_paramを渡す（_paramには渡したい値）
            // この時ResultViewControllerにて受け取る同型の変数を用意しておかないとエラーになる
            textView.second = _param
        }
    }
    

    //    textviewに書き込んだ文字列を変数に入れる
    @IBAction func tapReturnKey(sender: UITextField){
        var reserchText = NSUserDefaults.standardUserDefaults()
        reserchText.setObject(sender.text, forKey: "reserch")
        reserchText.synchronize()
    }
    
    
    
    
    
    
    
    

    
    @IBOutlet weak var scvBackGround: UIScrollView!
    
    var txtActiveField = UITextField()
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        txtActiveField = textField
        return true
    }
    
    //  selfをデリゲートにしているので、ここにデリゲートメソッドを書く
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        var reserchText = NSUserDefaults.standardUserDefaults()
        reserchText.setObject(textField.text, forKey: "reserch")
        reserchText.synchronize()
        self.view.endEditing(true)
        return false
    }
    
    func handleKeyboardWillShowNotification(notification: NSNotification) {
        
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        let myBoundSize: CGSize = UIScreen.mainScreen().bounds.size
        
        let txtLimit = txtActiveField.frame.origin.y + txtActiveField.frame.height + 8.0
        let kbdLimit = myBoundSize.height - keyboardScreenEndFrame.size.height
        
//        println("テキストフィールドの下辺:\(txtLimit)")
//        println("キーボードの上辺:\(kbdLimit)")
        
        if txtLimit >= kbdLimit {
            scvBackGround.contentOffset.y = txtLimit - kbdLimit
        }
    }
    
    func handleKeyboardWillHideNotification(notification: NSNotification) {
        scvBackGround.contentOffset.y = 0
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: "handleKeyboardWillShowNotification:", name: UIKeyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: "handleKeyboardWillHideNotification:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    }



}








//        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
// AppDelegateのインスタンスを取得
//        appDelegate.message = "message"
// AppDelegateの変数を操作