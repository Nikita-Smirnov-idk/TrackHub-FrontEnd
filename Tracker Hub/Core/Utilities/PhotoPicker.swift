import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    /// Привязка к ссылке выбранного и сохранённого изображения в виде String
    @Binding var selectedImageString: String?
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 1  // Выбираем только одно изображение
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator  // Назначаем координатора делегатом
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        // Обновления не требуются
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Координатор для обработки делегат-методов PHPickerViewController
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        
        // Вызывается, когда пользователь выбирает изображение
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            guard let itemProvider = results.first?.itemProvider,
                  itemProvider.canLoadObject(ofClass: UIImage.self) else {
                return
            }
            
            // Загружаем изображение
            itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                if let image = object as? UIImage {
                    DispatchQueue.main.async {
                        // Сохраняем изображение и получаем URL, затем сохраняем строковое представление
                        if let fileURL = saveImageToDocuments(image: image) {
                            self.parent.selectedImageString = fileURL.absoluteString
                        }
                    }
                } else {
                    print("Ошибка загрузки изображения: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
        }
    }
}

/// Функция для сохранения UIImage в директорию документов и получения URL
func saveImageToDocuments(image: UIImage, fileName: String = UUID().uuidString + ".jpg") -> URL? {
    guard let data = image.jpegData(compressionQuality: 0.8) else { return nil }
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let fileURL = documentsDirectory.appendingPathComponent(fileName)
    do {
        try data.write(to: fileURL)
        print(fileURL)
        return fileURL
    } catch {
        print("Ошибка сохранения изображения: \(error)")
        return nil
    }
}
