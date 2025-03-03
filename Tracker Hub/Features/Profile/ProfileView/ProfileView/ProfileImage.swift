//
//  ProfileImage.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 10.02.2025.
//

import SwiftUI

struct ProfileImage: View {
    @StateObject var dataSource = DataSource()
    var geometry: GeometryProxy
    var user: User
    @State private var isPickerPresented: Bool = false
    @State private var image: UIImage? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            if let image = image{
                Image(uiImage: image)
                    .resizable()
                    .frame(width: geometry.size.height * 0.25, height: geometry.size.height * 0.25)
                    .cornerRadius(20)
                    .padding([.top, .trailing, .leading])
                
            }
            else{
                Image("\(user.avatar)")
                    .resizable()
                    .frame(width: geometry.size.height * 0.25, height: geometry.size.height * 0.25)
                    .cornerRadius(20)
                    .padding([.top, .trailing, .leading])
            }
            HStack(spacing: 0){
                Text("Изменить фото")
                    .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                    .multilineTextAlignment(.trailing)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding([.bottom, .top])
                    .foregroundStyle(Color(dataSource.selectedTheme.buttonsBackgroundColor))
                    .onTapGesture {
                        isPickerPresented = true
                    }
                
                Image(systemName: "camera.viewfinder")
                    .foregroundStyle(Color(dataSource.selectedTheme.buttonsBackgroundColor))
                    .font(.system(size: geometry.size.height * 0.025))
            }
        }
        .sheet(isPresented: $isPickerPresented) {
            PhotoPicker(selectedImage: $image)
        }
        
    }
}
