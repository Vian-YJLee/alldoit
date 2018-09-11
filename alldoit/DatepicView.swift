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
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickTime: UILabel!
    @IBOutlet weak var lblTimerCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        
        let datePicview = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblTimerCount.text = "선택시간: " + formatter.string(from: datePicview.date)
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
