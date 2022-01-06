//
//  Post.swift
//  After-iOS
//
//  Created by Thisisme Hi on 2022/01/07.
//

import Foundation

/// 위에 status, success, data는 제네릭으로 뺐음

// MARK: - PostModel

struct PostModel: Codable {
    let post: [Post]
}

// MARK: - Post

struct Post: Codable {
    let id: Int
    let title: String
    let category: Int
    let date: String
    let star: Int
    let oneline: [String]
}
