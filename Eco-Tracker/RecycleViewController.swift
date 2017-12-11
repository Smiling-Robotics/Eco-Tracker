//
//  RecycleViewController.swift
//  Eco-Tracker
//
//  Created by admin on 11/27/17.
//  Copyright © 2017 SmilingRobotics. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase



var pinName = ""
class RecycleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var items = [User]()

    @IBOutlet weak var myTableView: UITableView!
    
    let list = ["Milk", "Honey", "Tomatoes"]
    var myIndex = 0
    var products:[String] = []
    var handle:DatabaseHandle?
    var ref:DatabaseReference?
    
    //let databaseRef = Database.database().reference()
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(products.count)
        
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default,  reuseIdentifier: "cell")
        cell.textLabel?.text = products[indexPath.row]
        
        return(cell)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let text = cell?.textLabel?.text
        //print(text as Any)
        
        if (text == "Paper with tape")
        {
            pinName = "A"
            let viewController = storyboard?.instantiateViewController(withIdentifier: (pinName))
            self.navigationController?.pushViewController(viewController!, animated: true)
        }
        
        
        
        //myIndex = indexPath.row
        //debugPrint(myIndex)
        //if (myIndex == 2)
       // {
         //   debugPrint("HEllo")
         //   pinName = "A"
         //   let viewController = storyboard?.instantiateViewController(withIdentifier: (pinName))
         //   debugPrint(pinName)
         //   self.navigationController?.pushViewController(viewController!, animated: true)
       // }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       ref = Database.database().reference()
        
        handle = ref?.child("Products").observe(.childAdded, with: { (snapshot) in
           print (snapshot)
            
            
        
            
            if let item = snapshot.value as? [String: AnyObject]
            {
                let Product = User()
                Product.Names = item["Names"] as! String
                print (Product.Names)
                //Product.setValuesForKeys(item)
                //print(Product.Names as! String)
                
            
                self.products.append(Product.Names!)
                self.myTableView.reloadData()
            }
        })
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
