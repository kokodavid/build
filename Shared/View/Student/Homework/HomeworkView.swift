//
//  HoeworkView.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/16/21.
//

import SwiftUI

struct HoeworkView: View {
    @State private var selectedTab: Int = 0

    init() {
        UISegmentedControl.appearance().backgroundColor = .black
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        


    }
       var body: some View {
        NavigationView {
            VStack {
                self.studentBand
                   Picker("", selection: $selectedTab) {
                       Text("HOMEWORK").tag(0)
                       Text("POSTS").tag(1)
                   }
                   .pickerStyle(SegmentedPickerStyle())
                   

                   switch(selectedTab) {
                       case 0: EmptyView()
                       case 1: EmptyView()
                   default:
                    Spacer()
                   }
                Spacer()
            }
            .navigationBarTitle("Homework & Posts", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "arrow.clockwise")
            }))
            
            
        }
       }
    
    var studentBand: some View {
        HStack{
            
            Text("Student Full Name")
            Spacer()
        }.frame(height: 55.0)
    }
    
    var homeworkList: some View {
        List{
//            homework
        }
    }
   
}


struct HoeworkView_Previews: PreviewProvider {
    static var previews: some View {
        HoeworkView()
    }
}
