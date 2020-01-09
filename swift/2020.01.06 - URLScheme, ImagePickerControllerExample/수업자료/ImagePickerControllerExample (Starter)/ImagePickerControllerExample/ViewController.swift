//
//  ViewController.swift
//  ImagePickerControllerExample
//
//  Created by giftbot on 2020. 1. 4..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit
// 음성에 대한 권한~?
import MobileCoreServices

final class ViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  private let imagePiker = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imagePiker.delegate = self
  }
  
  @IBAction private func pickImage(_ sender: Any) {
    print("\n---------- [ pickImage ] ----------\n")
//    imagePiker.sourceType = .savedPhotosAlbum
    imagePiker.sourceType = .photoLibrary
    present(imagePiker, animated: true)
  }
  
  
  @IBAction private func takePicture(_ sender: Any) {
    print("\n---------- [ takePicture ] ----------\n")
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
    imagePiker.sourceType = .camera
    
//    ["public.image"]
    print(imagePiker.mediaTypes)
    
//    ["public.image", "public.movie"]
    let mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)
    imagePiker.mediaTypes = mediaTypes ?? []
    
//    imagePiker.mediaTypes = ["public.image"] 밑에랑 같음
//    imagePiker.mediaTypes = [kUTTypeImage as String]
//    imagePiker.mediaTypes = [kUTTypeImage,kUTTypeMovie] as [String]
    present(imagePiker, animated: true)
  }
  
  @IBAction private func takePictureWithDelay(_ sender: Any) {
    print("\n---------- [ takePictureWithDelay ] ----------\n")
    
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
    imagePiker.sourceType = .camera
    
    imagePiker.mediaTypes = [kUTTypeImage as String]
    
    present(imagePiker, animated: true) {
//      self.imagePiker.takePicture()
      DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
        self.imagePiker.takePicture()
      })
    }
    
  }
  
  
  @IBAction private func recordingVideo(_ sender: Any) {
    print("\n---------- [ recordingVideo ] ----------\n")
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
    imagePiker.sourceType = .camera
//  Movie -  소리 포함.  KUTTypeViede -  영상만
    imagePiker.mediaTypes = [kUTTypeMovie as String]  // "public.movie"
//  제일먼저 뭐가 선택될지
    imagePiker.cameraCaptureMode = .video
    
//  먼저 전면이닞 후면인지
    imagePiker.cameraDevice = .rear
    present(imagePiker, animated: true)

  }
  
  @IBAction private func toggleAllowsEditing(_ sender: Any) {
    print("\n---------- [ toggleAllowsEditing ] ----------\n")
    imagePiker.allowsEditing.toggle()
  }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    print("\n----------- [ didFinishPickingMediaWithInfo ] -----------\n")
    let mediaType = info[.mediaType] as! NSString
    if UTTypeEqual(mediaType, kUTTypeImage){
      let originalImage = info[.originalImage] as! UIImage
      let editedImage = info[.editedImage] as? UIImage
      let selectedImage = editedImage ?? originalImage
      imageView.image = selectedImage
      
      if picker.sourceType == .camera{
        // 사진 저장
        UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil)
      }
    } else if UTTypeEqual(mediaType, kUTTypeMovie) {
      if let mediaPath = (info[.mediaURL] as? NSURL)?.path, UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(mediaPath) {
        UISaveVideoAtPathToSavedPhotosAlbum(mediaPath, nil, nil, nil)
      }
    }
    
    picker.dismiss(animated: true)
  }
  
//  cancel 메서드에서 할 작업이 없으면 생략
//  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//    print("\n----------- [ didFinishPickingMediaWithInfo ] -----------\n")
//    picker.dismiss(animated: true)
//  }
}
