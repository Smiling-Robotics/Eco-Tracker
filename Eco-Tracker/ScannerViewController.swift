//
//  ScannerViewController.swift
//  Eco-Tracker
//
//  Created by admin on 12/4/17.
//  Copyright © 2017 SmilingRobotics. All rights reserved.
//

import UIKit
import AVFoundation
var ProductCodes:[String] = ["01212901","01213007","01255906","01257904","01200081131","01200002862","01222403","078000206401",
                             "012000150098","012000013812","078000013528","04963406"]

class ScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet weak var square: UIImageView!
    var video = AVCaptureVideoPreviewLayer()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = AVCaptureSession()
        
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)

        do
        {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
            
        }
        catch
        {
            print("Error")
        }
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.ean13, AVMetadataObject.ObjectType.upce]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
       //self.view.bringSubview(toFront: square)
        //self.view.bringSubview(toFront: square)
        session.startRunning()
        
        
        
        
        // Do any additional setup after loading the view.
    }
   
    //func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!){
    internal func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [ AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects != nil && metadataObjects.count != 0
        {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
                if (object.type == AVMetadataObject.ObjectType.ean13)
                {
                    for item in ProductCodes {
                        if (item == object.stringValue)
                        {
                            
                            myIndex = 17
                            pinName = "Q"
                            let viewController = storyboard?.instantiateViewController(withIdentifier: (pinName))
                            
                            
                            self.navigationController?.pushViewController(viewController!, animated: true)
                            print("Coke")
                        }
                    }
                    let alert = UIAlertController(title: "BarCode", message: object.stringValue, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "Copy", style: .default, handler: {(nil) in UIPasteboard.general.string = object.stringValue}))
                    present(alert, animated: true, completion: nil)
                    
                }
                
                if (object.type == AVMetadataObject.ObjectType.upce)
                {
                    for item in ProductCodes {
                        if (item == object.stringValue)
                        {
                           myIndex = 17
                            pinName = "Q"
                            let viewController = storyboard?.instantiateViewController(withIdentifier: (pinName))
                            self.navigationController?.pushViewController(viewController!, animated: true)
                            print("Coke")
                        }
                    }
                    let alert = UIAlertController(title: "BarCode", message: object.stringValue, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "Copy", style: .default, handler: {(nil) in UIPasteboard.general.string = object.stringValue}))
                    present(alert, animated: true, completion: nil)
                    
                }
               // for item in ProductCodes {
               //     if (item == object.stringValue)
               //     {
               //         pinName = "B"
                //        let viewController = storyboard?.instantiateViewController(withIdentifier: (pinName))
                //        self.navigationController?.pushViewController(viewController!, animated: true)
                //        print("Coke")
                  //  }
                //}
            }
        }
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
