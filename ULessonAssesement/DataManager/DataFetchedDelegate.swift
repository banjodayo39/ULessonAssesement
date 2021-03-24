//
//  DataFetchedDelegate.swift
//  ULessonAssesement
//
//  Created by Dayo Banjo on 3/24/21.
//

import Foundation

protocol DataFetchedDelegate {
    func onDataFetched()
    func onFetchError(error: Error)
}
