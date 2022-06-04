//
//  MoviesCD+CoreDataProperties.swift
//  
//
//  Created by SNOW on 05/06/22.
//
//

import Foundation
import CoreData


extension MoviesCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoviesCD> {
        return NSFetchRequest<MoviesCD>(entityName: "MoviesCD")
    }

    @NSManaged public var adult: Bool
    @NSManaged public var backdropPath: String?
    @NSManaged public var id: Int64
    @NSManaged public var mediaType: String?
    @NSManaged public var originalTitle: String?
    @NSManaged public var overview: String?
    @NSManaged public var popularity: Double
    @NSManaged public var posterPath: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var title: String?
    @NSManaged public var video: Bool
    @NSManaged public var voteAverage: Double
    @NSManaged public var voteCount: Int64

}
