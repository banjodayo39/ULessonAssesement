//
//  HomeRepositoryService.swift
//  ULessonAssesement
//
//  Created by Dayo Banjo on 3/24/21.
//

import Foundation

class HomeNetworkService: NetworkService {
    let networkManager = NetworkManager()
    
    func getSubjects(completion: @escaping (Result<Response, Error>) -> ()) {
        networkManager.makeRequest(requestType: .get, url: "https://jackiechanbruteforce.ulesson.com/3p/api/content/grade", params: nil, completionHandler: completion)
    }
}
