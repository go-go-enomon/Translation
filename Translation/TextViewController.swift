//
//  TextViewController.swift
//  Translation
//
//  Created by 榎本拓馬 on 2015/06/18.
//  Copyright (c) 2015年 榎本拓馬. All rights reserved.
//

import Foundation

import UIKit

class TextViewController: UIViewController {
    
    @IBOutlet var text: UITextField!
    

    
    @IBAction func array(){
    
    // 何も無い状態をチェック
    let myDefault = NSUserDefaults.standardUserDefaults()
    if let readDict = myDefault.objectForKey("save") as? [String: String] {
        let readData2 = readDict["key2"]!
    } else {
    println("No such Data")
    }
    // No such data!
    // データを用意して保存
    let saveData = ["key1": "data1", "key2": "data2", "key3": "data3"]
    let saveDefault = NSUserDefaults.standardUserDefaults()
    saveDefault.setObject(saveData, forKey: "save")
    saveDefault.synchronize()
    // 再度読み出し
    if let readDict = myDefault.objectForKey("save") as? [String: String] {
        let readData2: String! = readDict["key2"]
        let readData3: String! = readDict["key3"]
        let readData4: String! = readDict["key4"]
        println("Data of key2 = (readData2)")
        println("Data of key3 = (readData3)")
        println("Data of key4 = (readData4)")
    } else {
    println("No such Data")
    }
    /*
    Data of key2 = data2
    Data of key3 = data3
    Data of key4 = nil
    */
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
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //@IBAction func text(sender:AnyObject){
        
        //var first = text.text
        //Array.append(first)
        //self.performSegueWithIdentifier("Hey!", sender: self)
    //}

}






