//
//  HomeViewModel.swift
//  ULessonAssesement
//
//  Created by Dayo Banjo on 3/24/21.
//

import Foundation

class HomeViewModel {
    
    let delegate: DataFetchedDelegate?
    let networkService: HomeNetworkService
    var subjects: [Subject] = []
    
    init(delegate: DataFetchedDelegate?, networkService: HomeNetworkService) {
        self.delegate = delegate
        self.networkService = networkService
        getSubjects()
    }
    
    func getSubjects() {
        networkService.getSubjects { [weak self] (response) in
            switch response {
                case .success(let data):
                    self?.subjects = data.data?.subjects ?? []
                    self?.delegate?.onDataFetched()
                case .failure(let error):
                    self?.delegate?.onFetchError(error: error)
            }
        }
    }
    
}
