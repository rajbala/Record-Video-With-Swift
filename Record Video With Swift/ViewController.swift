//
//  ViewController.swift
//  VideoRecord1
//
//  Created by Raj Bala on 9/17/14.
//  Copyright (c) 2014 Raj Bala. All rights reserved.
//

import UIKit
import MediaPlayer
import MobileCoreServices
import AVFoundation


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    let captureSession = AVCaptureSession()
    var previewLayer : AVCaptureVideoPreviewLayer?
    var captureDevice : AVCaptureDevice?
    
    override func viewDidAppear(animated: Bool) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            
            
            println("captureVideoPressed and camera available.")
            
            var imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = .Camera;
            imagePicker.mediaTypes = [kUTTypeMovie!]
            imagePicker.allowsEditing = false
            
            imagePicker.showsCameraControls = true
            
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
            
        }
            
        else {
            println("Camera not available.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info:NSDictionary!) {
        
        let tempImage = info[UIImagePickerControllerMediaURL] as NSURL!
        let pathString = tempImage.relativePath
        self.dismissViewControllerAnimated(true, completion: {})
        
        UISaveVideoAtPathToSavedPhotosAlbum(pathString, self, nil, nil)
        
    }
    
}

