//
//  File.swift
//  
//
//  Created by MacbookPro13 on 11/01/23.
//

import Foundation

public struct CategoryModel: Equatable, Identifiable {

    public let id: String
    public let title: String
    public let image: String
    public let description: String
    public let isFavorite: Bool
  
    public init(id: String, title: String, image: String, description: String, isFavorite: Bool) {
        self.id = id
        self.title = title
        self.image = image
        self.description = description
        self.isFavorite = isFavorite
    }
}
