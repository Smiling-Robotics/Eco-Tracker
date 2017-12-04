//
//  RecycleViewController.swift
//  Eco-Tracker
//
//  Created by admin on 11/27/17.
//  Copyright © 2017 SmilingRobotics. All rights reserved.
//

import UIKit
var pinName = ""
class RecycleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let list = ["Milk", "Honey", "Tomatoes"]
    var myIndex = 0
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(list.count)
        
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default,  reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return(cell)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        myIndex = indexPath.row
        debugPrint(myIndex)
        if (myIndex == 2)
        {
            debugPrint("HEllo")
            pinName = "A"
            let viewController = storyboard?.instantiateViewController(withIdentifier: (pinName))
            debugPrint(pinName)
            self.navigationController?.pushViewController(viewController!, animated: true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
