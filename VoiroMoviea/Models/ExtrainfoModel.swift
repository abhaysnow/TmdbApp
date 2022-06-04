//
//  ExtrainfoModel.swift
//  VoiroMoviea
//
//  Created by SNOW on 04/06/22.
//

import Foundation
struct ExtrainfoModel: Codable {
    let averageRating: Double?
    let backdropPath: String?
    let comments: [String: String?]?
    let createdBy: CreatedBy?
    let welcomeDescription: String?
    let id: Int?
    let iso3166_1: String?
    let iso639_1: Language?
    let name: String?
    let objectIDS: [String: String?]?
    let page: Int?
    let posterPath: String?
    let welcomePublic: Bool?
    let results: [MoviesModel]?
    let revenue, runtime: Int?
    let sortBy: String?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case averageRating = "average_rating"
        case backdropPath = "backdrop_path"
        case comments
        case createdBy = "created_by"
        case welcomeDescription = "description"
        case id
        case iso3166_1 = "iso_3166_1"
        case iso639_1 = "iso_639_1"
        case name
        case objectIDS = "object_ids"
        case page
        case posterPath = "poster_path"
        case welcomePublic = "public"
        case results, revenue, runtime
        case sortBy = "sort_by"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - CreatedBy
struct CreatedBy: Codable {
    let gravatarHash, id, name, username: String?

    enum CodingKeys: String, CodingKey {
        case gravatarHash = "gravatar_hash"
        case id, name, username
    }
}
