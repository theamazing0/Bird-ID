//
//  ViewController.swift
//  Bird ID
//
//  Created by Samvid Konchada on 8/29/20.
//  Copyright © 2020 Samvid. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet var percentagesLook: UIButton!
    @IBOutlet var imageView: UIImageView!
    var pickerController = UIImagePickerController()
    @IBOutlet var decriptionLabel: UILabel!
    let model = BackyardBirdImageClassifier_1()
    var output = ""
    var percentages: [String: Double] = [:]
    var goingOutKind = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
    }
    
    func buffer(from image: UIImage) -> CVPixelBuffer? {
      let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
      var pixelBuffer : CVPixelBuffer?
      let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(image.size.width), Int(image.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
      guard (status == kCVReturnSuccess) else {
        return nil
      }

      CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
      let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)

      let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
      let context = CGContext(data: pixelData, width: Int(image.size.width), height: Int(image.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)

      context?.translateBy(x: 0, y: image.size.height)
      context?.scaleBy(x: 1.0, y: -1.0)

      UIGraphicsPushContext(context!)
      image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
      UIGraphicsPopContext()
      CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))

      return pixelBuffer
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
            do {
                let image = buffer(from: selectedImage)
                let prediction = try model.prediction(image:  image!)
                output = prediction.classLabel
                percentages = prediction.classLabelProbs
                print(percentages)
            } catch {
                output = "Error"
            }
            decriptionLabel.text = output
            percentagesLook.setTitle("Check Percentages", for: .normal)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func OpenFile(_ sender: Any) {
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
    }
    @IBAction func seePercentages(_ sender: Any) {
        goingOutKind = "P"
        performSegue(withIdentifier: "mainToPerc", sender: percentages)
    }
    
    
    @IBAction func infoWanted(_ sender: Any) {
        goingOutKind = "I"
        performSegue(withIdentifier: "mainToScroll", sender: output)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if goingOutKind == "P"{
            let DesVC = segue.destination as! PercTableViewController
            let myPercentages = sender as! Dictionary<String,Double>
            DesVC.percentages = myPercentages
        }
        if goingOutKind == "I"{
            let DesVC = segue.destination as! ScrollViewController
            let myBird = sender as! String
            DesVC.myBird = myBird
        }
    }
}

