//
//  ViewController.swift
//  Eco-Tracker
//
//  Created by admin on 11/27/17.
//  Copyright © 2017 SmilingRobotics. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class ViewController: UIViewController {
    var handle:DatabaseHandle?
    var ref:DatabaseReference?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ref = Database.database().reference()
        
        handle = ref?.child("Products").observe(.childAdded, with: { (snapshot) in
            //print (snapshot)
            
            
            
            
            if let item = snapshot.value as? [String: AnyObject]
            {
                let Product = User()
                Product.Names = item["Names"] as! String
                Product.Recycleable = item["Recyclable"] as! String?
                Product.How = item["How"] as! String?
                Product.Other = item["Other"] as! String?
                
                
                
                //print (Product.Names)
                //Product.setValuesForKeys(item)
                //print(Product.Names as! String)
                
                
                products.append(Product.Names!)
                isRecycleable.append(Product.Recycleable!)
                How.append(Product.How!)
                Other.append(Product.Other!)
                
                
            }
            
        })
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

