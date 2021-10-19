//
//  ReportCardList.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/19/21.
//

import SwiftUI

struct ReportCardList: View {
    let homeWork  = ["",""]
    var body: some View {
        VStack{
            List(homeWork, id: \.self){
                homework in
                ReportCardItem(termName: "Term 3 2020", date: "2020-12-1", teacher: "Mr Omoto", className: "Class 4 North")
            }
        }
    }
}

struct ReportCardList_Previews: PreviewProvider {
    static var previews: some View {
        ReportCardList()
            .previewDevice("iPhone 12")
    }
}
