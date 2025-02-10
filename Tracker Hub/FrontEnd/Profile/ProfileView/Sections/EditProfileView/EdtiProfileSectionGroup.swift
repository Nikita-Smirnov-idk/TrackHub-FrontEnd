//
//  EdtiProfileSectionGroup.swift
//  Tracker Hub
//
//  Created by Рома Николаев on 10.02.2025.
//

import SwiftUI

struct EdtiProfileSectionGroup: View {
    @StateObject var dataSource = DataSource()
    var geometry: GeometryProxy
    var sectionList: [String]
    @State var user: PlugUser
    
    var body: some View {
        VStack(spacing: 0){
            ForEach(0..<sectionList.count){ index in
                HStack{
                    Text(sectionList[index])
                        .font(Font.custom(Fonts.ReadexPro_Bold.rawValue, size: 16))
                        .foregroundStyle(Color(dataSource.selectedTheme.backgroundColor))
                    
                    TextField("", text: $user.name)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
                
                if index != sectionList.count - 1{
                    Rectangle()
                        .fill(Color(dataSource.selectedTheme.backgroundColor))
                        .frame(height: 1)
                        .padding(.horizontal)
                }
            }
        }
        .frame(width: geometry.size.width * 0.85)
        .background(Color(dataSource.selectedTheme.buttonsBackgroundColor))
        .cornerRadius(20)
        .padding(.bottom)
    }
}
