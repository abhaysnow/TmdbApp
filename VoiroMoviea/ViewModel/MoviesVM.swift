//
//  MoviesVM.swift
//  VoiroMoviea
//
//  Created by SNOW on 04/06/22.
//

import CoreData
import Foundation

class MoviesVM {
    
 //   weak var vc: UserDetails?
    var moviesList : ExtrainfoModel?
    
    //------------------------------------------------------
    
    //MARK: Service call with URL Session
    
    func moviesListApi(completion : @escaping ((Bool,String)->()))  {
        let serviceUrl = APIConstants.BASE_URL + "list/3?api_key=" + APIConstants.API_KEY
        if InternetConnectionManager.isConnectedToNetwork(){
            URLSession.shared.dataTask(with: URL(string: serviceUrl)!) { data, response, error in
                if error == nil {
                    if let data = data {
                        do{
                            let responseString = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any]
                            let jsonData = try JSONSerialization.data(withJSONObject: responseString ?? [String:Any].self, options: .prettyPrinted)
                            self.moviesList = try JSONDecoder().decode(ExtrainfoModel.self, from: jsonData)
                            completion(true, "Api hit Successfully")
                        } catch let err{
                            print(err.localizedDescription)
                            completion(false, err.localizedDescription)
                        }
                    }
                
                } else {
                    completion(false, error?.localizedDescription ?? "")
                    print(error?.localizedDescription ?? "")
                }
            }.resume()
        }else{
            print("Not Connected")
            completion(false, "Not Connected")
        }
    }
}

