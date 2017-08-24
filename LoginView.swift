//
//  LoginView.swift
//  demo
//
//  Created by ispl Mac Mini on 8/24/17.
//  Copyright © 2017 infinium. All rights reserved.
//

import UIKit

class LoginView: UIViewController {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtPass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnTap(_ sender: UIButton) {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if txtName.text == ""
        {
            let alert = UIAlertController(title: nil, message: "Please enter email", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                self.txtName.becomeFirstResponder()
            }))
            self.present(alert, animated: true, completion: nil)
            return
        }
        else if (emailTest.evaluate(with: txtName.text) == false)
        {
            let alert = UIAlertController(title: nil, message: "Please enter valid email", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                self.txtName.text=""
                self.txtName.becomeFirstResponder()
            }))
            self.present(alert, animated: true, completion: nil)
            return
        }
        else if txtPass.text == ""
        {
            let alert = UIAlertController(title: nil, message: "Please enter password", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                self.txtPass.becomeFirstResponder()
            }))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        
//        if Reachability.isConnectedToNetwork() == false
//        {
//            let msg="Internet is not connected. Please connect the internet first"
//            let alert = UIAlertController(title: nil, message: msg , preferredStyle: UIAlertControllerStyle.Alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { action in
//            }))
//            self.presentViewController(alert, animated: true, completion: nil)
//            return
//        }
        
        let dict:NSMutableDictionary = NSMutableDictionary()
        dict.setValue(txtName.text!, forKey: "email")
        dict.setValue(txtPass.text!, forKey: "password")
        //dict.setValue(UserDefaults.standard.object(forKey: "device_token"), forKey: "device_token")
        dict.setValue("3FEEB9B6B925878DED2A9F5E4E6399D07EB4729AE42A1124A61938CDC90FFF0E", forKey: "device_token")
        dict.setValue("device_type", forKey: "iOS")
        
        print(dict)
        API.userLogin(dict as! [AnyHashable : Any]) { (response, error) in
            if(error == nil)
            {
                print("\(String(describing: response))")
                print("\(String(describing: response?["code"]))")
                
                if((response?["code"] as! Int) == 1)
                {
                    print("\(String(describing: response?["response"]))")
                    
                    let defaults = UserDefaults.standard
                    defaults.set((response?["response"] as! NSDictionary).object(forKey: "user_id"), forKey: "user_id")
                    defaults.set((response?["response"] as! NSDictionary).object(forKey: "name"), forKey: "name")
                    defaults.set((response?["response"] as! NSDictionary).object(forKey: "email"), forKey: "email")
                    defaults.set((response?["response"] as! NSDictionary).object(forKey: "password"), forKey: "password")
                
                    defaults.synchronize()
                    
                    UserDefaults.standard.set(true, forKey: "Login")
                    UserDefaults.standard.synchronize()
                    
                    let vc=(self.storyboard?.instantiateViewController(withIdentifier: "HomeScreen"))! as! HomeScreen
                    self.navigationController?.pushViewController(vc, animated: true)
                }
               // print("\(String(describing: response))")
            }
            else
            {
                let msg="Something went wrong, please try after sometime"
                let alert = UIAlertController(title: nil, message: msg , preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
}
