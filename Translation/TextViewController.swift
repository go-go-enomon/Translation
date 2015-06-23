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
        
        //        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        //        appDelegate.message = "message"
        //appDelegateの変数を操作
        
        // selfをデリゲートにする
        self.text.delegate = self
        
        // 何も無い状態をチェック
        var myDefault = NSUserDefaults.standardUserDefaults()
        if let readDict = myDefault.objectForKey("save") as? [String: String] {
            let readData2 = readDict["だめだ"]!
        } else {
//            println("No such Data")
        }
        // No such data!
        
        
        // データを用意して保存
        var saveData = ["いらっしゃいませ"/*key1*/: "おいでやす"/*data1*/, "だめだ": "あかん", "ありがとう": "おおきに"]
        var saveDefault = NSUserDefaults.standardUserDefaults()
        saveDefault.setObject(saveData, forKey: "save")
        saveDefault.synchronize()
        
//        辞書データが入っているか確認
//        for (key, val) in saveData {
//         println("saveData[\(key)]=\(val)")
//        }
        
}
    
//    textviewに書き込んだ文字列を変数に入れる
    @IBAction func tapReturnKey(sender: UITextField){
        var reserchText = NSUserDefaults.standardUserDefaults()
        reserchText.setObject(sender.text, forKey: "reserch")
        reserchText.synchronize()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    @IBOutlet weak var scvBackGround: UIScrollView!
    
    var txtActiveField = UITextField()
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        txtActiveField = textField
        return true
    }
    
    //  selfをデリゲートにしているので、ここにデリゲートメソッドを書く
    func textFieldShouldReturn(textField: UITextField) -> Bool {
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
