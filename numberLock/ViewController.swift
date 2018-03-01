//
//  ViewController.swift
//  numberLock
//
//  Created by BensonShen on 2018/2/28.
//  Copyright © 2018年 BensonShen. All rights reserved.
//

import UIKit
import GameKit //匯入相關的函式庫

class ViewController: UIViewController {
    var answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1 //得到0~99 +1 的亂數 寫在這裡是在畫面讀入前先取亂數
    var maxNumber = 100
    var minNumber = 1
    var isOver = false
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent //狀態列調整為白色
    }
    @IBOutlet weak var messageLable: UILabel!
    @IBOutlet weak var inputTextFild: UITextField!
    @IBOutlet weak var background: UIImageView!
    
    @IBAction func makeAGuess(_ sender: UIButton) {
        if isOver == false{
            //playing game
            print(answer)
            let inputText = inputTextFild.text! //！驚嘆號是向程式保證裡面一定有文字
            inputTextFild.text="" //清空輸入匡
            
            let inputNumber = Int(inputText) //假如User 輸入 abc 或是空白 轉換整數就會得到 nil
            
            if inputNumber == nil{  //排除使用者不是輸入數字
                messageLable.text="No input! Guess a number between \(minNumber) ~\(maxNumber)."
            }
            else{
                if inputNumber! > maxNumber{ //使用者輸入比100大時顯示 too big
                    messageLable.text="Too big!  Guess a number between \(minNumber) ~\(maxNumber)."
                }else if inputNumber! < minNumber{ //使用者輸入比1小時顯示 too small
                    messageLable.text="To small!  Guess a number between \(minNumber) ~\(maxNumber)."
                }else if inputNumber == answer{ //使用者答對
                    messageLable.text="You are right.Press [guess] to play again"
                    isOver = true
                    background.image = UIImage(named: "Finish") //把底圖換成解鎖
                }
                else{
                    if inputNumber! > answer{
                        maxNumber = inputNumber!
                    }else{
                        minNumber = inputNumber!
                    }
                    messageLable.text="Try again!  Guess a number between \(minNumber) ~\(maxNumber)."
                }
                
            }
            
        }else{
            //game is over
            maxNumber = 100
            minNumber = 1
            messageLable.text="Guess a number between \(minNumber) ~\(maxNumber)."
            answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
            isOver = false
            background.image = UIImage(named: "BG") //把底圖設定成上鎖
        }
    }
    
    override func viewDidLoad() { //畫面讀入
        super.viewDidLoad()
        inputTextFild.becomeFirstResponder() //讓文字輸入匡成為焦點 一進入程式 就像點了該物件一樣
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

