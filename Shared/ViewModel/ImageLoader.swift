//
//  ImageLoader.swift
//  EduwebParents (iOS)
//
//  Created by user175092 on 7/16/21.
//

import Foundation
import Combine
import SwiftUI


class ImageLoader : ObservableObject {
    @Published var image: UIImage?
       private let url: URL

       init(url: URL) {
           self.url = url
       }

       deinit {
           cancel()
       }
       
       func load() {}

       func cancel() {}

}
