//
//  PrimaryDetailListItem.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/19/21.
//

import SwiftUI

struct PrimaryDetailListItem: View {
    @State var label: String
    @State var detail: String
    var body: some View {
        HStack{
            Text(label)
            Text(detail)
        }
    }
}

struct PrimaryDetailListItem_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryDetailListItem(label: "Admission date", detail: "92/07/2020")
    }
}
