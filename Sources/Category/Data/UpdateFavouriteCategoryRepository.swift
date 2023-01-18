//
//  File.swift
//  
//
//  Created by MacbookPro13 on 18/01/23.
//

import Core
import Combine

public struct UpdateFavouriteCategoryRepository<
    CategoryLocaleDataSource: LocaleDataSource,
    Transformer: Mapper>: Repository
where
    // 2
    CategoryLocaleDataSource.Response == CategoryEntity,
    Transformer.Response == CategoryResponse,
    Transformer.Entity == CategoryEntity,
    Transformer.Domain == CategoryModel {
  
    // 3
    public typealias Request = String
    public typealias Response = CategoryModel
    
    private let _localeDataSource: CategoryLocaleDataSource
    private let _mapper: Transformer
    
    public init(
        localeDataSource: CategoryLocaleDataSource,
        mapper: Transformer) {
        
        _localeDataSource = localeDataSource
        _mapper = mapper
    }
    
    // 4
    public func execute(request: String?) -> AnyPublisher<CategoryModel, Error> {
        return _localeDataSource.get(id: request ?? "")
            .map { _mapper.transformEntityToDomain(entity: $0) }
            .eraseToAnyPublisher()
    }
}
