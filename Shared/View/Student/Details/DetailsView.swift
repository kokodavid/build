//
//  DetailsView.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/16/21.
//

import SwiftUI

struct DetailsView: View {
    @State private var selectedTab: Int = 0
    
    let primaryDetails = ["Admission date", "Admission No", "Student category","First name", "Middle name", "Last name", "Gender", "D.O.B", "Class entry","Payment plan"]

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
                       Text("Details").tag(0)
                       Text("Family").tag(1)
                    Text("Medical").tag(2)
                    Text("Enrolled").tag(3)
                   }
                   .pickerStyle(SegmentedPickerStyle())
                   

                   switch(selectedTab) {
                   case 0: self.detailList                       case 1: self.familyList                   default:
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
    
    var detailList: some View {
        List( primaryDetails, id: \.self){
            details in
            PrimaryDetailListItem(label: details, detail: "")
        }
    }
    
    var familyList: some View {
        VStack(){
            Form{
                
            }
        }
    }
   
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
