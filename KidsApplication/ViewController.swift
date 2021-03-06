//
//  ViewController.swift
//  KidsApplication
//
//  Created by macos on 7/5/20.
//  Copyright © 2020 macos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var alphabetImage: UIImageView!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet var lblNum: UILabel!
    
    @IBAction func stepper(_ sender: UIStepper) {
        lblNum.text=String(Int(sender.value))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Loginbtn(_ sender: Any) {
        if email.text == ("user@gmail.com") && password.text == ("user")
        {
            let sec: HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "home") as! HomeViewController;
            self.navigationController?.pushViewController(sec, animated: true)
        }
        else{
            let alert = UIAlertController(title:"Wrong credentials!", message: "Type correct email and password!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title:"OK", style: .default, handler:nil))
                
                self.present(alert, animated: true,completion: nil)
            
        }
        
    }
    
   
    @IBAction func alphabetSegmentController(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            alphabetImage.image=UIImage(named: "alphabet1")!
        case 1:
            alphabetImage.image=UIImage(named: "consonants")!
        case 2:
            alphabetImage.image=UIImage(named: "vowels")!
        default:
            break;
            
        }
    }
    
}

