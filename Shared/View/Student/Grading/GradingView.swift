//
//  GradingView.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/16/21.
//

import SwiftUI

struct GradingView: View {
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
                       Text("Report Cards").tag(0)
                       Text("Exam Marks").tag(1)
                    Text("Assessment").tag(2)
                   }
                   .pickerStyle(SegmentedPickerStyle())
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/ ){
                        Text("FILTER").padding(10).frame(maxWidth: 100,idealHeight: 45).background(Color(red: 57/255, green: 124/255, blue: 73/255)).foregroundColor(.white)
                    }.padding()
                    Spacer()
                }

                   switch(selectedTab) {
                       case 0: ReportCardList()
                       case 1: EmptyView()
                   case 2: EmptyView()
                   default:
                    Spacer()
                   }
                Spacer()
            }
            .navigationBarTitle("Student details", displayMode: .inline)
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

struct GradingView_Previews: PreviewProvider {
    static var previews: some View {
        GradingView()
            .previewDevice("iPhone 12")
    }
}
