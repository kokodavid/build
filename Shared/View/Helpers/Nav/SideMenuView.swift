//
//  SideMenuView.swift
//  EduwebParents (iOS)
//
//  Created by Arthur on 23/06/2021.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack {
            //Add student lists
            HStack {
                Image(systemName: "house.fill")
                    .foregroundColor(.primaryGreen)
                    .imageScale(.large)
                
                Text("Home")
                    .foregroundColor(.primaryGreen)
                    .font(.headline)
            }
            .padding(.top, 100)
            
            HStack {
                Image(systemName: "")
                    .foregroundColor(.primaryGreen)
                    .imageScale(.large)
                
                Text("Menu")
                    .foregroundColor(.primaryGreen)
                    .font(.headline)
            }
            
            HStack {
                Image(systemName: "money")
                    .foregroundColor(.primaryGreen)
                    .imageScale(.large)
                
                Text("Payment")
                    .foregroundColor(.primaryGreen)
                    .font(.headline)
            }
            
            HStack {
                Image(systemName: "house.fill")
                    .foregroundColor(.primaryGreen)
                    .imageScale(.large)
                
                Text("Home")
                    .foregroundColor(.primaryGreen)
                    .font(.headline)
            }
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
            .previewDevice("iPhone 11")
    }
}
