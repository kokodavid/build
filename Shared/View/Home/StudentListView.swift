//
//  StudentListView.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/16/21.
//

import SwiftUI


struct StudentListView: View {
    var student: Student
    
        
    var body: some View {
        VStack(alignment: .center) {
//            AsyncImage(url: URL(string: "https://example.com/icon.png")) { image in
//                image.resizable()
//            } placeholder: {
//                ProgressView()
//            }
//            .frame(width: 50, height: 50)
            Section{
            Image(systemName: "person")
                .font(.system(size: 60))
                .foregroundColor(.black)
            Text(student.studentName).multilineTextAlignment(.center)
            Text(student.className).foregroundColor(.gray)
            Text(student.schoolName).foregroundColor(.gray)
                .multilineTextAlignment(.center)
            }
        }
    }
}

struct StudentListView_Previews: PreviewProvider {
    static var previews: some View {
        let student = AuthManager().students[0]
        StudentListView(student: student)
    }
}
