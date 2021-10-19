//
//  DrawerItem.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/12/21.
//

import SwiftUI

struct DrawerItem: View {
    var menuItem: String
    var menuIcon: String
    var body: some View {
        HStack{
            Image(systemName: menuIcon)
                .frame(width: 50, height: 50)
                .foregroundColor(Color("PrimaryGreen"))
            
            Text(menuItem).foregroundColor(Color("PrimaryGreen"))
            Spacer()
            
        }
    }
}

struct DrawerItem_Previews: PreviewProvider {
    static var previews: some View {
        DrawerItem(menuItem: "Home", menuIcon: "house.fill")
        
    }
}
