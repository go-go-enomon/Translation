//
//  ResultViwController.swift
//  Translation
//
//  Created by 榎本拓馬 on 2015/06/18.
//  Copyright (c) 2015年 榎本拓馬. All rights reserved.
//

import Foundation

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var ResultTextlabel: UILabel!
    
    
    /// ラベルをアウトプット接続
    @IBOutlet weak var myLabel: UILabel!
    
    /// 遷移時の受け取り用の変数
    var second:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ラベルに受け取った遷移用の変数を渡す
        myLabel.text = second

        
        // 何も無い状態をチェック
        //        var myDefault = NSUserDefaults.standardUserDefaults()
        //        if let readDict = myDefault.objectForKey("save") as? [String: String] {
        //            let readData2 = readDict["だめだ"]!
        //        } else {
        //            //            println("No such Data")
        //        }
        // No such data!
        
        // データを用意して保存
        var saveData = ["いらっしゃいませ"/*key1*/: "おいでやす"/*data1*/, "だめだ": "あかん", "ありがとう": "おおきに"]
        
        var readData = saveData["いらっしゃいませ"]
        var readData2 = saveData["だめだ"]
        var readData3 = saveData["ありがとう"]
        
        var reserchText = NSUserDefaults.standardUserDefaults()
//        reserchText.setObject(sender.text, forKey: "reserch")
        reserchText.synchronize()
        
        if readData == reserchText {
            ResultTextlabel.text = "\(readData)"
        } else if readData2 == reserchText {
            ResultTextlabel.text = "\(readData2)"
        } else if readData3 == reserchText {
            ResultTextlabel.text = "\(readData3)"
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
        
//        var saveDefault = NSUserDefaults.standardUserDefaults()
//        
//        if let readDict = saveDefault.objectForKey("save") as? [String: String] {
//            let readData = readDict["いらっしゃいませ"]!
//            let readData2 = readDict["だめだ"]!
//            let readData3 = readDict["ありがとう"]!
//        }
//        
//        //        saveDefault.setObject(saveData, forKey: "save")
//        saveDefault.synchronize()
//        
//        //        辞書データが入っているか確認
//        //        for (key, val) in saveData {
//        //         println("saveData[\(key)]=\(val)")
//        //        }
//        
//        
//        
//        
////        var saveDefault = NSUserDefaults.standardUserDefaults()
//
//    
//        var resultText = reserchText.objectForKey("reserch")
//        reserchText.synchronize()
//        
//        if resultText = readData {
//            ResultTextlabel.text = "\(readData)"
//        } else if resultText = readDict["だめだ"] {
////            readData2 = readDict["だめだ"]
//            ResultTextlabel.text = "\(readData2)"
//        } else if resultText = readDict["ありがとう"] {
////            readData3 = readDict["ありがとう"]
//            ResultTextlabel.text = "\(readData3)"
//        } else {
//            ResultTextlabel.text = "No such Data"
//        }
//////
////    }
//        // 再度読み出し
//        /*if let readDict = saveDefault.objectForKey("save") as? [String: String] && resulttext = reserchText.objectForKey("reserch") as? [String: String] {
//        
//            
//           if  reserchText = readDict["いらっしゃいませ"] {
//                readData: String! = readDict["いらっしゃいませ"]
//                ResultTextlabel.text = "\(readData)"
//            } else if let reserchText = readDict["だめだ"] {
//                readData2: String! = readDict["だめだ"]
//                ResultTextlabel.text = "\(readData2)"
//            } else if let reserchText =
//                readData3: String! = readDict["ありがとう"] {
//                ResultTextlabel.text = "\(readData3)"
//            } else {
//                ResultTextlabel.text = "No such Data"
//            }
//            
//    
//        }
//    }*/
//        
//        
//        // 消去
//        //        saveDefault.removeObjectForKey("save")
//        //        saveDefault.synchronize()
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    //        var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    //AppDelegateのインスタンスを取得
    //        var message = appDelegate.message
    
}
