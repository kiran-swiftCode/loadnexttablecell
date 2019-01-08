//
//  PagedResponse.swift
//  loadnexttablecell
//
//  Created by kiran on 1/7/19.
//  Copyright © 2019 kiran. All rights reserved.
//

import Foundation

struct PagedResponse<T : Codable> : Codable {
    let currentPage: Int
    let numberOfPages: Int
    let totalResults: Int
    let data: [T]
}

