
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
class TextViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{
    
    var myUIPicker: UIPickerView!
    var myBox: UIView!
    var doneButton: UIButton!
    @IBOutlet weak var selectButton: UIButton!

    // 表示する値の配列.
    private let myValues: NSArray = ["いいね","いらっしゃいませ","本当に","何","だめだ","ありがとう","ごはん", "苦しい"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupPicker()
    
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
    
    func setupPicker() {
        
        myBox = UIView(frame: CGRectMake(0,self.view.bounds.height,self.view.bounds.width,200))
        myBox.backgroundColor = UIColor.whiteColor()
        myBox.layer.masksToBounds = true
        self.view.addSubview(myBox)
        
        myUIPicker = UIPickerView()
        
        // サイズを指定する.
        myUIPicker.frame = CGRectMake(0,0,self.view.bounds.width, 180.0)
        // Delegateを設定する.
        myUIPicker.delegate = self
        // DataSourceを設定する.
        myUIPicker.dataSource = self
        // Viewに追加する.
        myBox.addSubview(myUIPicker)
        doneButton = UIButton()
        // サイズを設定する.
        doneButton.frame = CGRectMake(self.myBox.frame.width - 100,0,100,40)
        // 背景色を設定する.
        doneButton.backgroundColor = UIColor.whiteColor()
        // タイトルを設定する(通常時).
        doneButton.setTitle("Done", forState: UIControlState.Normal)
        doneButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        doneButton.addTarget(self, action: "onClickDoneButton:", forControlEvents: .TouchUpInside)

        myBox.addSubview(doneButton)

    }
    
    @IBAction func popupPickerView(sender: AnyObject) {
        UIView.animateWithDuration(0.4, animations: {() -> Void in
            self.myBox.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height - self.myBox.frame.size.height/2)
            }, completion: {(Bool) -> Void in
                
        })
    }
    
    func onClickDoneButton(sender: UIButton){
        UIView.animateWithDuration(0.4, animations: {() -> Void in
            self.myBox.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height + self.myBox.frame.size.height/2)
            }, completion: {(Bool) -> Void in
                
        })
    }
    // pickerView=======================================================
    // pickerに表示する列数を返すデータソースメソッド
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    // pickerに表示する行数を返すデータソースメソッド
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myValues.count
    }
    // pickerに表示する値を返すデリゲートメソッド
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        return myValues[row] as! String
    }
    // pickerが選択された際に呼ばれるデリゲートメソッド
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        println("row: \(row)")
        println("value: \(myValues[row])")
        self.selectButton.setTitle(myValues[row] as? String, forState: .Normal)
        self.selectButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
    }
    
    // segueによる受け渡し=======================================================
    //画面遷移ボタン
    @IBAction func myButton(sender: AnyObject) {
        performSegueWithIdentifier("segue",sender: nil)
    }
    //画面遷移時に値を遷移先に渡す
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segue") {
            // SecondViewControllerクラスをインスタンス化してsegue（画面遷移）で値を渡せるようにバンドルする
            var resultView : ResultViewController = segue.destinationViewController as! ResultViewController
            // resultView（バンドルされた変数）に受け取り用の変数を引数とし_paramを渡す（_paramには渡したい値）
            // この時ResultViewControllerにて受け取る同型の変数を用意しておかないとエラーになる
            resultView.second = self.selectButton.titleLabel?.text
        }
    }
    
}