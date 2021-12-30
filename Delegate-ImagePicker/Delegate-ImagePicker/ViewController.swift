//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by KyungDong Han on 2021/12/30.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 이미지 파커에서 이미지를 선택하지 않고 취소했을 때 호출되는 메서드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 이미지 피커 컨트롤러 창 닫기
        picker.presentingViewController?.dismiss(animated: false, completion: {
            () in
            let alert = UIAlertController(title: "", message: "이미지 선택이 최소되었습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            self.present(alert, animated: false, completion: nil)
        })
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.presentingViewController?.dismiss(animated: false) {
            () in
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.imageView.image = img
        }
    }

    @IBAction func pick(_ sender: Any) {
        // 이미지 피커 컨트롤러 인스턴스 생성
        let picker = UIImagePickerController()
        // 이미지 소스로 사진 라이브러리 선택
        picker.sourceType = .photoLibrary
        // 이미지 편집 기능 On
        picker.allowsEditing = true
        picker.delegate = self
        
        self.present(picker, animated: false)
    }
    
}

