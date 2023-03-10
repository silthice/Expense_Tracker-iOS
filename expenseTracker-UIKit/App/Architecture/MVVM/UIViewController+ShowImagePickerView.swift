//
//  UIViewController+ShowImagePickerView.swift
//  expenseTracker-UIKit
//
//  Created by Giap on 10/03/2023.
//

import UIKit
import RxSwift
import RxCocoa
import MobileCoreServices

protocol ShowImagePickerViewType : class {
    func showImagePicker(from: UIView) -> Observable<[UIImagePickerController.InfoKey:AnyObject]>
}

extension ShowImagePickerViewType where Self : UIViewController {
    func picker(from view: UIView, i:Int) -> Observable<[UIImagePickerController.InfoKey:AnyObject]> {
        func pick(with picker: UIImagePickerController) -> Observable<[UIImagePickerController.InfoKey:AnyObject]> {
            return Observable.create { observer -> Disposable in
                let d1 = picker.rx.didFinishPickingMediaWithInfo.debug("xx1 - didFinish").subscribe(onNext: { [weak self] value in
                    guard let `self` = self else { return }
                    self.dismiss(animated: true, completion: nil)
                    observer.onNext(value)
                    observer.onCompleted()
                })
                let d2 = picker.rx.didCancel.debug("xx2 - didCancel").subscribe(onNext: { [weak self] error in
                    guard let `self` = self else { return }
                    self.dismiss(animated: true, completion: nil)
                    let cancelError = NSError(domain: "", code: 99, userInfo: [
                        NSErrorUserInfoKey.LocalizedTitle: "Error",
                        NSErrorUserInfoKey.LocalizedDescription: "Cancelled"
                    ])
                    observer.onError(cancelError)
                    observer.onCompleted()
                })
                return Disposables.create([d1, d2])
            }
        }
        
        let picker  = UIImagePickerController()
        if i == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                picker.allowsEditing = false
                picker.sourceType = .camera
                picker.cameraCaptureMode = .photo
                picker.modalPresentationStyle = .fullScreen
                self.present(picker,animated: true,completion: nil)
                return pick(with: picker)
            }
            // prevent crash in devices without camera or is simulator
            let cancelError = NSError(domain: "", code: 99, userInfo: [
                NSErrorUserInfoKey.LocalizedTitle: "Error",
                NSErrorUserInfoKey.LocalizedDescription: "Cancelled"
            ])
            return Observable.error(cancelError)
        } else if i == 1 {
            picker.allowsEditing = false
            picker.sourceType = .photoLibrary
            picker.mediaTypes = [kUTTypeImage as String]
            //picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            picker.modalPresentationStyle = .popover
        
            if let popoverPresentationController = picker.popoverPresentationController {
                popoverPresentationController.sourceView = view
                popoverPresentationController.sourceRect = view.bounds
            }
            
            self.present(picker, animated: true, completion: nil)
            return pick(with: picker)
        } else {
            let cancelError = NSError(domain: "", code: 99, userInfo: [
                NSErrorUserInfoKey.LocalizedTitle: "Error",
                NSErrorUserInfoKey.LocalizedDescription: "Cancelled"
            ])
            return Observable.error(cancelError)
        }
    }
    
    func showImagePicker(from view: UIView) -> Observable<[UIImagePickerController.InfoKey:AnyObject]> {
        let cameraAction = UIAlertController.AlertAction(title: "Camera", style:.default, leftIcon: nil)
        let galleryAction = UIAlertController.AlertAction(title: "Photo Gallery", style:.default, leftIcon: nil)
        let cancelAction = UIAlertController.AlertAction(title: "Cancel", style:.cancel, leftIcon: nil)
        let actions: [UIAlertController.AlertAction] = [cameraAction, galleryAction, cancelAction]
        
        return UIAlertController
            .present(in: self, view: view, title: nil, message: nil, style: .actionSheet, actions: actions)
            .flatMapLatest{ i -> Observable<[UIImagePickerController.InfoKey:AnyObject]> in
                return Observable<[UIImagePickerController.InfoKey:AnyObject]>.create({ ob -> Disposable in
                    DispatchQueue.main.async {
                        _ = self.picker(from: view, i: i.0).bind(to: ob)
                    }
                    return Disposables.create()
                })
        }
    }
}

