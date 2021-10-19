//
//  NavigationDrawer.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/12/21.
//

import SwiftUI

struct NavigationDrawer: View {
    private let width = UIScreen.main.bounds.width - 100
    let isOpen: Bool
    @State var students:[Student] = Student.data

    var body: some View {
        VStack {
            
    
            HStack{
                DrawerContent()
                    .frame(width: self.width)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)
                Spacer()
            }
        }
    }
}

struct NavigationDrawer_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDrawer(isOpen: true)
            .previewDevice("iPhone 12")
    }
}
