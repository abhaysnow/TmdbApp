//
//  MoviesCD+CoreDataClass.swift
//  
//
//  Created by SNOW on 05/06/22.
//
//

import Foundation
import CoreData
import UIKit

@objc(MoviesCD)
public class MoviesCD: NSManagedObject {

}
class CoreDatabase : NSObject {
    static let shared = CoreDatabase()
    
    func loadSaveData(completionBlock : @escaping ((_ data : [MoviesModel]) -> Void))  {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MoviesCD")
        
        do {
            let results = try context.fetch(fetchRequest)
            let obtainedResults = results as! [NSManagedObject]
            if obtainedResults.count > 0{
                var userData : [MoviesModel] = []
                for data in obtainedResults {
                    let adults = data.value(forKey: "adult") as? Bool ?? false
                    let backdropPaths = data.value(forKey: "backdropPath") as? String ?? ""
                   // let genreID = data.value(forKey: "genreIDS") as? [Int] ?? []
                    let ids = data.value(forKey: "id") as? Int ?? 0
                    let mediaType = data.value(forKey: "mediaType") as? String
                    let originalTitle = data.value(forKey: "originalTitle") as? String ?? ""
                    let overview = data.value(forKey: "overview") as? String ?? ""
                    let popularity = data.value(forKey: "popularity") as? Double ?? 0.0
                    let posterPath = data.value(forKey: "posterPath") as? String ?? ""
                    let releaseDate = data.value(forKey: "releaseDate") as? String ?? ""
                    let title = data.value(forKey: "title") as? String ?? ""
                    let video = data.value(forKey: "video") as? Bool ?? false
                    let voteAverage = data.value(forKey: "voteAverage") as? Double ?? 0.0
                    let voteCount = data.value(forKey: "voteCount") as? Int ?? 0
                    let ourData : MoviesModel = MoviesModel(adult: adults, backdropPath: backdropPaths, genreIDS: nil, id: ids, mediaType: mediaType, originalLanguage: nil, originalTitle: originalTitle, overview: overview, popularity: popularity, posterPath: posterPath, releaseDate: releaseDate, title: title, video: video, voteAverage: voteAverage, voteCount: voteCount)
                    
                    userData.append(ourData)
                }
                completionBlock(userData)
            }
        } catch {
            print("Error")
        }
    }
    
    func saveDataInCoreData(dataForSave : [MoviesModel]) {
        
        DispatchQueue.main.async {
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            
            for data in dataForSave{
                let entity = NSEntityDescription.entity(forEntityName: "MoviesCD",in: managedContext)!
                
                let item = NSManagedObject(entity: entity,insertInto: managedContext)
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MoviesCD")
                fetchRequest.predicate = NSPredicate(format: "id = %d", data.id!)
                
                let res = try! managedContext.fetch(fetchRequest)
                
                if res.count == 0{
                    item.setValue(data.id, forKey: "id")
                    item.setValue(data.voteAverage, forKey: "voteAverage")
                    item.setValue(data.backdropPath, forKey: "backdropPath")
                    item.setValue(data.adult, forKey: "adult")
                   // item.setValue(data.genreIDS, forKey: "genreIDS")
                    item.setValue(data.mediaType, forKey: "mediaType")
                   // item.setValue(data.originalLanguage, forKey: "originalLanguage")
                    item.setValue(data.overview, forKey: "overview")
                    item.setValue(data.popularity, forKey: "popularity")
                    item.setValue(data.posterPath, forKey: "posterPath")
                    item.setValue(data.releaseDate, forKey: "releaseDate")
                    item.setValue(data.title, forKey: "title")
                    item.setValue(data.video, forKey: "video")
                    item.setValue(data.voteCount, forKey: "voteCount")
                }
            }
            
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
}
