//
//  User.swift
//  EduwebParents (iOS)
//
//  Created by Arthur on 21/06/2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.welcomeTask(with: url) { welcome, response, error in
//     if let welcome = welcome {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Welcome
struct LoginResponse: Codable {
    public let response: String
    public let data: DataClass
    public let post: Post
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.dataClassTask(with: url) { dataClass, response, error in
//     if let dataClass = dataClass {
//       ...
//     }
//   }
//   task.resume()

// MARK: - DataClass
struct DataClass: Codable {
    let parentID: Int
    let username: String
    let active: Bool
    let firstName: String
    let middleName: String
    let lastName, email, parentFullName, deviceUserID: String
    let schoolGuardianID: Int
    let students: [Student]
    let news: News
    let feedback: Feedback
    let resources: Resources

    enum CodingKeys: String, CodingKey {
        case parentID = "parent_id"
        case username, active
        case firstName = "first_name"
        case middleName = "middle_name"
        case lastName = "last_name"
        case email
        case parentFullName = "parent_full_name"
        case deviceUserID = "device_user_id"
        case schoolGuardianID = "school_guardian_id"
        case students, news, feedback, resources
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.feedbackTask(with: url) { feedback, response, error in
//     if let feedback = feedback {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Feedback
struct Feedback: Codable {
    let learners: [FeedbackLearner]
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.feedbackLearnerTask(with: url) { feedbackLearner, response, error in
//     if let feedbackLearner = feedbackLearner {
//       ...
//     }
//   }
//   task.resume()

// MARK: - FeedbackLearner
struct FeedbackLearner: Codable {
    let feedbackType: String
    let postID: Int
    let sentDate, subject, message, postedBy: String
    let studentName, parentFullName, className: String
    let studentID, empID: Int
    let teacherName, studentAttachment, formattedDate: String

    enum CodingKeys: String, CodingKey {
        case feedbackType = "feedback_type"
        case postID = "post_id"
        case sentDate = "sent_date"
        case subject, message
        case postedBy = "posted_by"
        case studentName = "student_name"
        case parentFullName = "parent_full_name"
        case className = "class_name"
        case studentID = "student_id"
        case empID = "emp_id"
        case teacherName = "teacher_name"
        case studentAttachment = "student_attachment"
        case formattedDate = "formatted_date"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.newsTask(with: url) { news, response, error in
//     if let news = news {
//       ...
//     }
//   }
//   task.resume()

// MARK: - News
struct News: Codable {
    let learners: [NewsLearner]
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.newsLearnerTask(with: url) { newsLearner, response, error in
//     if let newsLearner = newsLearner {
//       ...
//     }
//   }
//   task.resume()

// MARK: - NewsLearner
struct NewsLearner: Codable {
    let comID: Int
    let comDate, creationDate, comType, subject: String
    let message: String
    let sendAsEmail, sendAsSMS: Bool
    let postedBy, audience: String
    let attachment, replyTo, studentName, parentFullName: String?
    let guardianID, studentID: Int?
    let className: String?
    let postStatus: String
    let sent: Bool
    let sentDate: String
    let messageFrom: Int
    let sendMethod: String
    let seenCount: Int?
    let seenBy: String?
    let seen: Bool

    enum CodingKeys: String, CodingKey {
        case comID = "com_id"
        case comDate = "com_date"
        case creationDate = "creation_date"
        case comType = "com_type"
        case subject, message
        case sendAsEmail = "send_as_email"
        case sendAsSMS = "send_as_sms"
        case postedBy = "posted_by"
        case audience, attachment
        case replyTo = "reply_to"
        case studentName = "student_name"
        case parentFullName = "parent_full_name"
        case guardianID = "guardian_id"
        case studentID = "student_id"
        case className = "class_name"
        case postStatus = "post_status"
        case sent
        case sentDate = "sent_date"
        case messageFrom = "message_from"
        case sendMethod = "send_method"
        case seenCount = "seen_count"
        case seenBy = "seen_by"
        case seen
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.resourcesTask(with: url) { resources, response, error in
//     if let resources = resources {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Resources
struct Resources: Codable {
    let learners: [ResourcesLearner]
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.resourcesLearnerTask(with: url) { resourcesLearner, response, error in
//     if let resourcesLearner = resourcesLearner {
//       ...
//     }
//   }
//   task.resume()

// MARK: - ResourcesLearner
struct ResourcesLearner: Codable {
    let studentID, resourceID, classID, termID: Int
    let empID: Int
    let resourceName, resourceType, fileName, additionalText: String
    let activeResource: Bool
    let vimeoPath: String?
    let teacherName, studentName, termName, className: String
    let creationDate: String

    enum CodingKeys: String, CodingKey {
        case studentID = "student_id"
        case resourceID = "resource_id"
        case classID = "class_id"
        case termID = "term_id"
        case empID = "emp_id"
        case resourceName = "resource_name"
        case resourceType = "resource_type"
        case fileName = "file_name"
        case additionalText = "additional_text"
        case activeResource = "active_resource"
        case vimeoPath = "vimeo_path"
        case teacherName = "teacher_name"
        case studentName = "student_name"
        case termName = "term_name"
        case className = "class_name"
        case creationDate = "creation_date"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.studentTask(with: url) { student, response, error in
//     if let student = student {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Student
struct Student: Codable {
    let studentID: Int
    let firstName: String
    let middleName: String?
    let lastName, studentImage, admissionNumber, studentName: String
    let active: Bool
    let className: String
    let classID, classCatID: Int
    let reportCardType, admissionDate, studentCategory, gender: String
    let dob, paymentMethod, paymentPlanName, schoolName: String
    let schoolSubdomain, useFeedback, school: String

    enum CodingKeys: String, CodingKey {
        case studentID = "student_id"
        case firstName = "first_name"
        case middleName = "middle_name"
        case lastName = "last_name"
        case studentImage = "student_image"
        case admissionNumber = "admission_number"
        case studentName = "student_name"
        case active
        case className = "class_name"
        case classID = "class_id"
        case classCatID = "class_cat_id"
        case reportCardType = "report_card_type"
        case admissionDate = "admission_date"
        case studentCategory = "student_category"
        case gender, dob
        case paymentMethod = "payment_method"
        case paymentPlanName = "payment_plan_name"
        case schoolName = "school_name"
        case schoolSubdomain = "school_subdomain"
        case useFeedback = "use_feedback"
        case school
    }
}

extension Student: Hashable {
    static var data : [Student] {
        [
        Student(studentID: 277, firstName: "Arthur", middleName: "Sidney", lastName: "Pundo", studentImage: "", admissionNumber: "111", studentName: "Arthur Sidney Pundo", active: true, className: "Class 5 Neema", classID: 1, classCatID: 2, reportCardType: "Upper primary", admissionDate: "", studentCategory: "self sponsored", gender: "M", dob: "2000", paymentMethod: "Mpesa", paymentPlanName: "Annually", schoolName: "Developer School", schoolSubdomain: "dev", useFeedback: "", school: "dev")
        ]
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.postTask(with: url) { post, response, error in
//     if let post = post {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Post
struct Post: Codable {
    let userName, userPwd, deviceUserID: String

    enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case userPwd = "user_pwd"
        case deviceUserID = "device_user_id"
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func welcomeTask(with url: URL, completionHandler: @escaping (LoginResponse?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

