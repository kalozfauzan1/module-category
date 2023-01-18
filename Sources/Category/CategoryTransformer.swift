//
//  File.swift
//  
//
//  Created by MacbookPro13 on 11/01/23.
//

import Core

public struct CategoryTransformer: Mapper {
    public typealias Request = Any
    public typealias Response = CategoryResponse
    public typealias Entity = CategoryEntity
    public typealias Domain = CategoryModel
    
    public init() {}
    
    public func transformResponseToEntity(request: Any?, response: CategoryResponse) -> CategoryEntity {
        let result = response
        let newCategory = CategoryEntity()
        newCategory.id = result.id ?? ""
        newCategory.title = result.title ?? "Unknown"
        newCategory.image = result.image ?? "Unknown"
        newCategory.desc = result.description ?? "Unknown"
        newCategory.isFavorite = false
        return newCategory
    }
    
    public func transformEntityToDomain(entity: CategoryEntity) -> CategoryModel {
        let result = entity
        return CategoryModel(
            id: result.id,
            title: result.title,
            image: result.image,
            description: result.desc,
            isFavorite: result.isFavorite
        )
    }
}

