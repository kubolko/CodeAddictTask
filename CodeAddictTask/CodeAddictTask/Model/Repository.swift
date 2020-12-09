//
//  Repository.swift
//  GitHubSearchWithSwiftUI
//
//  Created by marty-suzuki on 2019/06/05.
//  Copyright © 2019 jp.marty-suzuki. All rights reserved.
//

import Foundation

struct Repository: Decodable, Identifiable {
    let id: Int
    let fullName: String
    let avatar_id : URL
//    let description: String?
    let stargazersCount: Int
    let htmlUrl: URL
}
