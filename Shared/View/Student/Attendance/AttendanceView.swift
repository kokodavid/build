//
//  AttendanceView.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/16/21.
//

import SwiftUI

struct AttendanceView: View {
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
                       Text("ABSENTEEISM").tag(0)
                       Text("ATTENDANCE").tag(1)
                   }
                   .pickerStyle(SegmentedPickerStyle())
                   

                   switch(selectedTab) {
                   case 0: AbsenteeismView(studentName: "JOHN DOE", message: "message here ...")
                       case 1: Text("Under construction")
                   case 2: EmptyView()
                   default:
                    Spacer()
                   }
                Spacer()
            }
            .navigationBarTitle("Attendance", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "arrow.clockwise")
            }))
            
        }.onAppear(
        //make api call with loader
        )
       }
    
    var studentBand: some View {
        HStack{
            
            Text("Student Full Name")
            Spacer()
        }.frame(height: 30.0)
        .padding()
    }
}

struct AttendanceView_Previews: PreviewProvider {
    static var previews: some View {
        AttendanceView()
            .previewDevice("iPhone 12")
    }
}
