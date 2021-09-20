//
//  APIManager.swift
//  OdeumKopsas
//
//  Created by Angelos Staboulis on 19/9/21.
//

import Foundation
import Alamofire
import AlamofireRSSParser
class APIManager{
    static let shared = APIManager()
    private init(){}
    var image:Int!=0
    var rssArray:[Feed]=[]
    var videoRSS:[Feed]=[]
    func fetchVideos(completion:@escaping (([Feed])->()))->Void
    {
        let urlNews = URL(string: "https://www.youtube.com/feeds/videos.xml?channel_id=UCGLVF25EeueVaIZo9_cfO_w")
        let request = URLRequest(url: urlNews!)
        AF.request(request).responseRSS { dataResponse in
            let rssFeed:RSSFeed = dataResponse.value!
            for item in 0..<rssFeed.items.count{
                if (rssFeed.items[item].title!.count > 0){
                        let model = Feed(id: item, title: rssFeed.items[item].title!, link: rssFeed.items[item].mediaContent!, image: rssFeed.items[item].mediaThumbnail!)
                        self.videoRSS.append(model)
                }
            }
            completion(self.videoRSS)
        }
    }
    func fetchNews(completion:@escaping (([Feed])->()))->Void
    {
        let urlNews = URL(string: "https://kopsas.gr/feed/")
        let request = URLRequest(url: urlNews!)
        AF.request(request).responseRSS {  dataResponse in
            let rssFeed:RSSFeed = dataResponse.value!
            for item in 0..<rssFeed.items.count{
                if (rssFeed.items[item].title!.count > 0){
                    if self.image < rssFeed.items[item].imagesFromContent!.count{
                        let model = Feed(id: item, title: rssFeed.items[item].title!, link: rssFeed.items[item].link!, image: rssFeed.items[item].imagesFromContent![self.image])
                        self.rssArray.append(model)
                        self.image = self.image + 1
                    }
                }
                

            }
            completion(self.rssArray)
        }
    }
}
