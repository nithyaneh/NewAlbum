//
//  Service.swift
//  Album
//
//  Created by apple on 6/2/22.
//  Copyright © 2022 apple. All rights reserved.
//

import Foundation
import UIKit

class Service: NSObject {
    
   var urlString :String?
    
    static let shared = Service()
    
   func getAllAlbumData(completion: @escaping([AlbumModel]?, Error?) -> ()){
    
      let userURL =  urlString ?? ""
      
        guard let url = URL(string: userURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error{
                completion(nil,err)
                print("Loading data error: \(err.localizedDescription)")
            }else{
                guard let data = data else { return }
                do{
                    var arrMovieData = [AlbumModel]()
                    let results = try JSONDecoder().decode(ResultsModel.self, from: data)
                    for album in results.results{
                        arrMovieData.append(AlbumModel(artistName: album.artistName ?? "", trackName: album.trackName ?? "", artworkUrl100: album.artworkUrl100 ?? ""))
                    }
                    completion(arrMovieData, nil)
                }catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                }
            }
        }.resume()
    }
    
    
    
}
