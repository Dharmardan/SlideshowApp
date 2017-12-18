//
//  ViewController.swift
//  SlideshowApp
//
//  Created by だるま先生 on 2017/12/16.
//  Copyright © 2017年 だるま先生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var buttonColorM: UIButton!
    
    
    @IBOutlet weak var buttonColorR: UIButton!
    
    
    @IBOutlet weak var buttonText: UIButton!
    
    var tapCount = 0
    var sum = 0
    
    var timer:Timer?
    
    var imageBox = ["IMG_7326.jpg","IMG_7331.jpg","IMG_7142.jpg","IMG_7110.jpg","IMG_7111.jpg","IMG_7338.jpg","IMG_5401.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.image = UIImage(named: imageBox[sum])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ segue:UIStoryboardSegue){
        
    }
    
    func imageCount(){
        
        if sum < 6 {
            sum += 1
            imageView.image = UIImage(named: imageBox[sum])
        } else {
            sum -= 6
            imageView.image = UIImage(named: imageBox[sum])
        }
    }
    
    func buttonLabel(){
        
        buttonText.setTitle("再生", for: .normal)
        tapCount = 0
        buttonColorM.setTitleColor(UIColor(red: 0, green: 122 / 255, blue: 1, alpha: 1), for: .normal)
        buttonColorR.setTitleColor(UIColor(red: 0, green: 122 / 255, blue: 1, alpha: 1), for: .normal)
        timer?.invalidate()
    }
    
    @IBAction func moveOn(_ sender: Any) {
        
        if tapCount == 0{
            imageCount()
        }else {
            
        }
    }
    
    
    @IBAction func `return`(_ sender: Any) {
        
        if tapCount == 0{
            if sum  > 0 {
                sum -= 1
                imageView.image = UIImage(named: imageBox[sum])
            } else {
                sum += 6
                imageView.image = UIImage(named: imageBox[sum])
            }
        }else {
            
        }
    }
    
    @IBAction func play_pause(_ sender: Any){
        if tapCount == 0{
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector:#selector(updateTimer), userInfo: nil, repeats: true)
            buttonText.setTitle("停止", for: .normal)
            buttonColorM.setTitleColor(UIColor.gray, for: .normal)
            buttonColorR.setTitleColor(UIColor.gray, for: .normal)
            tapCount += 1
        }else {
            buttonLabel()
        }
        
    }
    
    func updateTimer(){
        imageCount()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.val = UIImage(named: imageBox[sum])
        buttonLabel()
    }

}

