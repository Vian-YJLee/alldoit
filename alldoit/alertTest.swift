//
//  alertTest.swift
//  alldoit
//
//  Created by LeeYongJin on 28/09/2018.
//  Copyright © 2018 vian. All rights reserved.
//

import UIKit

class alertTest: UIViewController {

    @IBOutlet var lampImg: UIImageView!
  
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    
    var isLampOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lampImg.image = imgOn

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnLampOn(_ sender: UIButton) {
        
        if(isLampOn==true) {
            
            let lampOnAlert = UIAlertController(title: "알림", message: "현재 램프가 켜져있는 상태입니다", preferredStyle: UIAlertControllerStyle.alert)
            let OnAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
            
            lampOnAlert.addAction(OnAction)
            present(lampOnAlert, animated: true, completion: nil)
        } else {
            
            lampImg.image = imgOn
            isLampOn = true
        }
        
        
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        
        if(isLampOn==true) {
            
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertControllerStyle.alert)
            
            let offAction = UIAlertAction(title: "네", style: UIAlertActionStyle.default, handler: {ACTION in self.lampImg.image = self.imgOff
                self.isLampOn=false
            })
            
            let cancleAction = UIAlertAction(title: "아니오", style: UIAlertActionStyle.default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancleAction)
            
            present(lampOffAlert, animated: true, completion: nil)
            
        }
        
        
    }
    @IBAction func btnLampRemove(_ sender: UIButton) {
        
        if (lampImg.image == imgRemove) {
            
            let isLampRemoveAlert = UIAlertController(title: "램프가 제거되어있습니다.", message: "램프를 다시 끼울까요?", preferredStyle: UIAlertControllerStyle.alert)
            
            let putInandOn = UIAlertAction(title: "네, 끼우고 켭니다.", style: UIAlertActionStyle.default, handler: {ACTION in self.lampImg.image = self.imgOn
                self.isLampOn = true
            })
            
            let putInandoff = UIAlertAction(title: "네, 끈 상태로 끼웁니다.", style: UIAlertActionStyle.default, handler: {ACTION in self.lampImg.image = self.imgOff
                self.isLampOn = false
            })
            
            let cancleAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.default, handler: nil)
            
            
            isLampRemoveAlert.addAction(putInandOn)
            isLampRemoveAlert.addAction(putInandoff)
            isLampRemoveAlert.addAction(cancleAction)
            
            present(isLampRemoveAlert, animated: true, completion: nil)
        }
        
       let lampRemoveAlert = UIAlertController(title: "램프제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertControllerStyle.alert)
       
        
        let offAction = UIAlertAction(title: "아니오, 램프를 끕니다.", style: UIAlertActionStyle.default, handler: {ACTION in self.lampImg.image = self.imgOff
            self.isLampOn = false
        })
        
        let onAction = UIAlertAction(title: "아니오, 램프를 켭니다", style: UIAlertActionStyle.default, handler: {ACTION in self.lampImg.image = self.imgOn
            self.isLampOn = true
        })
        
        let removeAction = UIAlertAction(title: "네, 램프를 제거합니다.", style: UIAlertActionStyle.default, handler: {ACTION in self.lampImg.image = self.imgRemove
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
        
    }
}
