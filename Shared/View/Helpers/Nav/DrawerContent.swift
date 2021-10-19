//
//  DrawerContent.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/12/21.
//

import SwiftUI

struct DrawerContent: View {
    var menuItems = ["Home","Menu","Payment","Feedback","Change password","School Contact", "Terms of Service", "V1.4.78", "Logout"]
    var menuIcons = ["house.fill","","dollarsign.square.fill","text.bubble.fill","lock.fill","phone.fill","doc.text.fill","v.circle.fill","pip.exit"]
    
    var students:[Student] = Student.data
    var body: some View {
        VStack {
            HStack {
                Text("MENU").font(.title).multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                Spacer()
            }.padding()
            .background(Color("PrimaryGreen"))
            ForEach(students, id:\.studentID){
                student in
                HStack{
                    Image(systemName: "person")
                    Text(student.studentName)
                    Spacer()
                }.padding()
            }
            Spacer()
            List (Array(zip(menuItems, menuIcons)), id: \.self.0) {
                (menuItem, menuIcon) in
                DrawerItem(menuItem: menuItem, menuIcon: menuIcon)
            }
        }
    }
}

struct DrawerContent_Previews: PreviewProvider {
    static var previews: some View {
        DrawerContent()
    }
}
