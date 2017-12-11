//
//  ProductViewController.swift
//  Eco-Tracker
//
//  Created by admin on 12/10/17.
//  Copyright © 2017 SmilingRobotics. All rights reserved.
//

import UIKit


class ProductViewController: UIViewController {

    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var ProductName: UILabel!
    @IBOutlet weak var Recycle: UILabel!
    @IBOutlet weak var HowRecycled: UITextView!
    @IBOutlet weak var OtherUse: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(myIndex)
       
        ProductName.text = products[myIndex]
       // print(image)
        Recycle.text = isRecycleable[myIndex]
        HowRecycled.text = How[myIndex]
        OtherUse.text = Other[myIndex]
        Image.image = UIImage.init(named: products[myIndex])
        //ProductName.text = User
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
