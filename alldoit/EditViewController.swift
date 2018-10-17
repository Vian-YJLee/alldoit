//
//  EditViewController.swift
//  alldoit
//
//  Created by LeeYongJin on 16/10/2018.
//  Copyright © 2018 vian. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    var textWayValue: String = ""

    @IBOutlet var lblWay: UILabel!
    
    @IBOutlet var txMeage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        lblWay.text = textWayValue
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    @IBAction func btnDone(_ sender: UIButton) {
    }
    
   

}
