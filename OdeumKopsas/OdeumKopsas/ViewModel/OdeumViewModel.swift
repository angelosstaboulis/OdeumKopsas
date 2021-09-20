//
//  OdeumViewModel.swift
//  OdeumKopsas
//
//  Created by Angelos Staboulis on 20/9/21.
//

import Foundation
class OdeumViewModel:ObservableObject{
    var apiManager:APIManager!
    @Published var newsRssArray:[Feed]=[]
    @Published var videoRssArray:[Feed]=[]
    init() {
        apiManager = APIManager.shared
    }
    func fetchVideos(){
        apiManager.fetchVideos { array in
            for item in 0..<array.count {
                self.videoRssArray.append(array[item])
            }
        }
    }
    func fetchNews(){
        apiManager.fetchNews { array in
            for item in 0..<array.count {
                self.newsRssArray.append(array[item])
            }
        }
    }
}
