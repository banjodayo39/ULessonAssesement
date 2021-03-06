//
//  UnknownError.swift
//  ULessonAssesement
//
//  Created by Dayo Banjo on 3/24/21.
//

import Foundation

enum UnknownError: String {
    case badUrl = "0xx1"
    case session = "0xx2"
    case httpResponse = "0xx3"
    case data = "0xx4"
    case decodableType = "0xx5"
    case unknown = "0xx6"
    
    static let unknownErrorArgs = "An Unknown error(%@) occured.\nTry again later"
    
}
