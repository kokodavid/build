//
//  NewsListItem.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/23/21.
//

import SwiftUI

struct NewsListItem: View {
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "newspaper")
                Text("System test to Kelvin by Nancy")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            
            HStack {
                Text("By: Fred Mwaniki Kaugi")
                
                Spacer()
                
                Text("On: Mon, 19 Jul 2021")
            }.padding()
        }
    }
}

struct NewsListItem_Previews: PreviewProvider {
    static var previews: some View {
        NewsListItem()
    }
}
