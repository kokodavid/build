//
//  ReportCardItem.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/19/21.
//

import SwiftUI

struct ReportCardItem: View {
    @State var termName: String
    @State var date: String
    @State var teacher: String
    @State var className: String
    
    var body: some View {
        VStack(spacing: 10) {
            HStack{
                VStack{
                    Text(termName).font(.system(size: 15))
                    HStack(alignment: .center){
                        Image(systemName: "calendar").font(.system(size: 15))
                        Text("\(date)").font(.system(size: 15))
                    }
                }
                
                Text("Teacher: \(teacher)").font(.system(size: 15))
                
                VStack{
                    Text(className).font(.system(size: 15))
                    Image(systemName: "arrow.down.doc.fill")
                }
            }
        }
    }
}

struct ReportCardItem_Previews: PreviewProvider {
    static var previews: some View {
        ReportCardItem(termName: "Term 3 2020", date: "2021-03-10", teacher: "Mr Omoto", className: "Class 4 North")
    }
}
