//
//  ViewController.swift
//  alldoit
//
//  Created by LeeYongJin on 29/08/2018.
//  Copyright © 2018 vian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblHello: UILabel!
    @IBOutlet weak var txtName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        
        lblHello.text = "Hello, " + txtName.text!
        
        //lbl txt changing
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
       
        
        if segue.identifier == "editButton" {
             editViewController.textWayValue = "segue: Use button"
            //button clicked
        }
        
        else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue: Use Bar Button"
        }
        //Bar button clicked
        
    }
    
    @IBAction func backhome(segue: UIStoryboardSegue) {
        
    }
}

