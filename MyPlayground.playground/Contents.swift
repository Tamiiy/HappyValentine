//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

var str = "Hello, playground"

// iphone6と同じサイズのviewを作る
let myView:UIView = UIView(frame: CGRectMake(0,0,320,568))
myView.backgroundColor = UIColor.grayColor()

let bg = UIImageView(frame:myView.frame)
bg.image = UIImage(named: "bg.jpg")
bg.contentMode = .ScaleAspectFill
myView.addSubview(bg)

// *** MorphingLabelを置いてみる ***
let textArray = [
    "Happy Valentine!!",
    "Who is your favorite person?",
    "uh.....",
    "Swift is my Lover!",
]
var i = 0
var text: String {
    if i >= textArray.count {
        i = 0
    }
    return textArray[i++]
}
var label = UILabel(frame: CGRectMake(0,100,myView.bounds.width,100))
label.text = text
label.font = UIFont.systemFontOfSize(20)
label.textAlignment = NSTextAlignment.Center
label.textColor = UIColor.whiteColor()
//    label.morphingEffect = .Sparkle
myView.addSubview(label)

// *** スタートボタン設置 ***
var switchButton:UIButton = UIButton()
switchButton.frame = CGRectMake(50,myView.bounds.height-150,myView.bounds.width-100,50)
switchButton.setTitle("START", forState: UIControlState.Normal)
switchButton.backgroundColor = UIColor(red:0, green:0, blue:0, alpha:0.6)
switchButton.layer.cornerRadius = 5.0;
switchButton.titleLabel?.font = UIFont.systemFontOfSize(18)
//switchButton.addTarget(self, action: "startTimer", forControlEvents: .TouchUpInside)
myView.addSubview(switchButton)

// *** 一定時間間隔でラベルを切り替える: need XCPlayground ***
func changeText() {
    label.text = text
}

// 無限実行フラグを有効にして、タイマーが動くようにする
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
class MyTimer: NSTimer {
    func startTimer() {
        NSTimer.scheduledTimerWithTimeInterval(2, target:self, selector: Selector("onTimer"), userInfo: nil, repeats: true)
    }
    func onTimer() {
        let today = NSDate()
        print("現在時刻は \(today) です")
        changeText()
    }
}
var myTimer = MyTimer()
myTimer.startTimer();

XCPlaygroundPage.currentPage.liveView = myView
