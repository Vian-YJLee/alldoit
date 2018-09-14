//
//  DatepicView.swift
//  alldoit
//
//  Created by LeeYongJin on 29/08/2018.
//  Copyright © 2018 vian. All rights reserved.
//

import UIKit

class DatepicView: UIViewController {
    
    let timeSelector: Selector = #selector(DatepicView.updateTime)
    let interval = 1.0
    var count = 0
    let current: Selector = #selector(DatepicView.currentTimer)
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickTime: UILabel!
    @IBOutlet weak var lblTimerCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: current, userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        let datePicview = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblPickTime.text = "선택시간: " + formatter.string(from: datePicview.date)
    }
    
    @objc func updateTime() {
        lblTimerCount.text = "타이머 카운터" + String(count)
        count = count + 1
        //timer method
        
    }
    
    @objc func currentTimer() {
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        
    }
    

}
