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
    @Binding var user: User?
    @State private var isPickerPresented: Bool = false
    @State private var newAvatar: String? = nil
    @ObservedObject var viewModel: EditProfileViewModel
    
    init(geometry: GeometryProxy, user: Binding<User?>) {
        self.geometry = geometry
        self._user = user
        
        if let unwrappedUser = user.wrappedValue {
            self._viewModel = ObservedObject(wrappedValue: EditProfileViewModel(user: unwrappedUser))
        } else {
            // Обработка случая, когда user == nil
            self._viewModel = ObservedObject(wrappedValue: EditProfileViewModel(user: User()))
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            if let currentUser = user, let fullAvatarURL = URL(string: currentUser.avatar) {
                AsyncImage(url: fullAvatarURL) { image in
                    image.resizable()
                         .aspectRatio(contentMode: .fill)
                         .frame(width: geometry.size.height * 0.25, height: geometry.size.height * 0.25)
                         .cornerRadius(20)
                    
                } placeholder: {
                    ProgressView()
                        .frame(width: geometry.size.height * 0.25, height: geometry.size.height * 0.25)
                        .cornerRadius(20)
                }
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
                        print("изменяем фото")
                        if let currentUser = user, let newAvatar = newAvatar, newAvatar != currentUser.avatar {
                            viewModel.editProfile()
                            print("фото изменено на \(newAvatar)")
                            user = viewModel.user
                        }
                        else{
                            print("не получается(((((")
                        }
                    }
                
                Image(systemName: "camera.viewfinder")
                    .foregroundStyle(Color(dataSource.selectedTheme.buttonsBackgroundColor))
                    .font(.system(size: geometry.size.height * 0.025))
            }
        }
        .sheet(isPresented: $isPickerPresented) {
            PhotoPicker(selectedImageString: $newAvatar)
        }
        
    }
}
