//
//  TextViewController.swift
//  Translation
//
//  Created by 榎本拓馬 on 2015/06/18.
//  Copyright (c) 2015年 榎本拓馬. All rights reserved.
//

import Foundation

import UIKit

class TextViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet var text: UITextField!
    

    
//    @IBAction func keyboard(sender: UITextField){
//        text.returnKeyType = UIReturnKeyType.Search
//        text.resignFirstResponder()
//    }
    
    
    @IBAction func array(){
    // 何も無い状態をチェック
    let myDefault = NSUserDefaults.standardUserDefaults()
    if let readDict = myDefault.objectForKey("save") as? [String: String] {
        let readData = readDict["いらっしゃいませ"]!
    } else {
    println("No such Data")
    }
    // No such data!
        
        
    // データを用意して保存
    var saveData = ["いらっしゃいませ"/*key1*/: "おいでやす"/*data1*/, "だめだ": "あかん", "ありがとう": "おおきに"]
    var saveDefault = NSUserDefaults.standardUserDefaults()
    saveDefault.setObject(saveData, forKey: "save")
    saveDefault.synchronize()
        

    // 消去
    saveDefault.removeObjectForKey("save")
    saveDefault.synchronize()

    }
    
    
    
    
    
    //翻訳するのが謎！
    @IBAction func change(){
    
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        appDelegate.message = "message"
        //appDelegateの変数を操作 
        self.text.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}






