//
//  StudentData.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/14/21.
//

import Foundation

class StudentData: ObservableObject {
    private static var studentsFolder: URL {
        do{
            return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        } catch {
            
                fatalError("Can't find documents directory")
            }
        }
    
    private static var fileURL: URL{
        return studentsFolder.appendingPathComponent("students.data")
    }
    
    @Published var students: [Student] = []
    
    func load() {
        DispatchQueue.global(qos: .background).async {
            [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                #if DEBUG
                DispatchQueue.main.async {
                    //self?.students = Student
                }
                #endif
                return
            }
            
            guard let studentsData = try? JSONDecoder().decode([Student].self, from: data) else{
                fatalError("Cannot decode saved student data")
            }
            
            DispatchQueue.main.async {
                self?.students = studentsData
            }
        }
    }
    
    func save() {
        DispatchQueue.global(qos: .background).async {
            [weak self] in
            guard let students = self?.students else {fatalError("Self out of scope")}
            guard let data = try? JSONEncoder().encode(students) else {fatalError("Error encoding data")}
            do {
                let outfile = Self.fileURL
                try data.write(to: outfile)
            }catch{
                fatalError("Cannot write to file ")
            }
        }
    }
}

