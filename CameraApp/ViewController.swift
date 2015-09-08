//
//  ViewController.swift
//  CameraApp
//
//  Created by 張翔 on 2015/09/08.
//  Copyright (c) 2015年 sho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet var imageView: UIImageView!
    
    var camera:Bool! = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func action(){
        let actionsheet: UIAlertController = UIAlertController(title: "title", message: "message", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let cancel: UIAlertAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.Cancel) { (UIAlertAction) -> Void in
            println("cancel")
        }
        
        let picture: UIAlertAction = UIAlertAction(title: "カメラで撮影", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            self.takepicture()
            println("picture")
        }
        
        let album: UIAlertAction = UIAlertAction(title: "アルバムから選択", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            self.fromalbum()
            println("album")
        }
        
        actionsheet.addAction(cancel)
        actionsheet.addAction(album)
        actionsheet.addAction(picture)
        
        self.presentViewController(actionsheet, animated: true, completion: nil)
        
        
        
    }
    
    func takepicture(){
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        self.presentViewController(imagePickerController, animated: true, completion: nil)
        
        camera = true
    }
    
    func fromalbum(){
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        self.presentViewController(imagePickerController, animated: true, completion: nil)
        
        camera = false
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        if camera == true{
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
    
    


}

