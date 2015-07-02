//
//  ExampleViewController.swift
//  Translation
//
//  Created by 榎本拓馬 on 2015/06/18.
//  Copyright (c) 2015年 榎本拓馬. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


class ExampleViewController: UIViewController,AVAudioPlayerDelegate {
    
    
    /// ラベルをアウトプット接続
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var exampleLabel2: UILabel!
    /// 遷移時の受け取り用の変数
    var example: String!
    var myAudioPlayer : AVAudioPlayer!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // データを用意して保存
        var saveData2 = ["おいでやす"/*key1*/:"ようこそいらっしゃいませ。"/*data1*/, "あかん": "もう私だめだ･･･", "おおきに": "6期iPhoneの皆さん今までありがとう！", "まんま": "このごはんおいしいですね。", "しんどい": "あなたのこと考えすぎて胸が苦しいよ。"]
        //saveData2の標準語だけを抜き出してkeyArray2に格納
        var keyArray2 = Array(saveData2.keys)
        //keyArray2の要素をhyoujyunWord2に入れてfor文を回す
        for hyoujyunWord2 in keyArray2 {
            if hyoujyunWord2 == self.example {
                self.exampleLabel.text = saveData2[hyoujyunWord2]
            }
        }
    
        // データを用意して保存
        var saveData3 = ["おいでやす"/*key1*/:"ようこそおいでやす。"/*data1*/, "あかん": "もううちあかん･･･", "おおきに": "6期iPhoneのみんなおおきに！", "まんま": "このまんまおいしおすなあ。", "しんどい": "うち、あんたのこと考えすぎて胸がしんどいねん。"]
        //saveData3の標準語だけを抜き出してkeyArray3に格納
        var keyArray3 = Array(saveData3.keys)
        //keyArray3の要素をhyoujyunWord3に入れてfor文を回す
        for hyoujyunWord3 in keyArray3 {
            if hyoujyunWord3 == self.example {
                self.exampleLabel2.text = saveData3[hyoujyunWord3]
            }
        }

        // 音声出力に関するコード======================================================
        // 再生する音源のURLを生成.
        let soundFilePath : NSString = NSBundle.mainBundle().pathForResource(self.example, ofType: "mp3")!
        let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath as! String)!
        
        // AVAudioPlayerのインスタンス化.
        myAudioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        // AVAudioPlayerのデリゲートをセット.
        myAudioPlayer.delegate = self
    }
    
    // ボタンがタップされた時に呼ばれるメソッド.
    @IBAction func onClickMyButton(sender: AnyObject) {
        
        // playingプロパティがtrueであれば音源再生中.
        if myAudioPlayer.playing == true {
            
            // myAudioPlayerを一時停止.
            myAudioPlayer.pause()
//            sender.setTitle("▶︎", forState: .Normal)
        } else {
            
            //myAudioPlayerの再生.
            myAudioPlayer.play()
//            sender.setTitle("■", forState: .Normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
