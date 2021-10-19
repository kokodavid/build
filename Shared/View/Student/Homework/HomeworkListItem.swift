//
//  HomeworkListItem.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/19/21.
//

import SwiftUI

struct HomeworkListItem: View {
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "book.fill").fixedSize()
                Text("Homework Name")
                Spacer()
            }
            Text("Wed, 26 May 2021 By: SOLOMON MAKAU").font(.subheadline)
        }.padding()
    }
}

struct HomeworkListItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeworkListItem()
            .previewDevice("iPhone 12")
    }
}
