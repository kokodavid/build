//
//  FeesView.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/16/21.
//

import SwiftUI

struct FeesView: View {
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
                       Text("Summary").tag(0)
                       Text("Invoices").tag(1)
                    Text("Payments").tag(2)
                    Text("Fee Items").tag(3)
                   }
                   .pickerStyle(SegmentedPickerStyle())
                   

                   switch(selectedTab) {
                       case 0: EmptyView()
                       case 1: EmptyView()
                   case 2: EmptyView()
                   case 3: EmptyView()
                   default:
                    Spacer()
                   }
                Spacer()
            }
            .navigationBarTitle("Student details", displayMode: .inline)
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
}

struct FeesView_Previews: PreviewProvider {
    static var previews: some View {
        FeesView()
    }
}
