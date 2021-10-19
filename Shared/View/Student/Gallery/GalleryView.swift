//
//  GalleryView.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/30/21.
//

import SwiftUI

struct GalleryView: View {
 
    var body: some View {
        NavigationView {
            VStack {
                self.studentBand
                self.galleryList
                    Spacer()
                   }
            
            .navigationBarTitle("Gallery", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "arrow.clockwise")
            }))
        }
            
        }
    var studentBand: some View {
        HStack{
            
            Text("Student Full Name")
            Spacer()
        }.frame(height: 30.0)
        .padding()
    }
    var galleryList: some View {
        List{
         
        }
    }
       }

    

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
