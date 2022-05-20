//
//  ImagePicker+Helper.swift
//  Envision
//
//  Created by Michael Arthur Alfano on 5/17/22.
//

import SwiftUI
import UIKit

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @Binding var isShown: Bool
    @Binding var image: Image?
    let completion: (Image) -> Void

    init(isShown: Binding<Bool>, image: Binding<Image?>, completion: @escaping (Image) -> Void) {
        _isShown = isShown
        _image = image
        self.completion = completion
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        image = Image(uiImage: uiImage)
        isShown = false
        completion(image!)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}

struct ImagePicker: UIViewControllerRepresentable {

    @Binding var isShown: Bool
    @Binding var image: Image?
    @Binding var picker: UIImagePickerController.SourceType
    let completion: (Image) -> Void

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }

    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(isShown: $isShown, image: $image, completion: completion)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = self.picker
        return picker
    }
}

struct PhotoCaptureView: View {

    @Binding var showImagePicker: Bool
    @Binding var image: Image?
    @Binding var picker: UIImagePickerController.SourceType
    let completion: (Image) -> Void

    var body: some View {
        ImagePicker(isShown: $showImagePicker, image: $image, picker: $picker, completion: completion)
    }
}
