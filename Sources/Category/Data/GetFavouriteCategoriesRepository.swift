//
//  File.swift
//  
//
//  Created by MacbookPro13 on 18/01/23.
//
import Core
import Combine

public struct GetFavouriteCategoriesRepository<
    CategoryLocaleDataSource: LocaleDataSource,
    RemoteDataSource: DataSource,
    Transformer: Mapper>: Repository
where
    // 2
    CategoryLocaleDataSource.Response == CategoryEntity,
    RemoteDataSource.Response == [CategoryResponse],
    Transformer.Response == [CategoryResponse],
    Transformer.Entity == [CategoryEntity],
    Transformer.Domain == [CategoryModel] {
  
    // 3
    public typealias Request = Any
    public typealias Response = [CategoryModel]
    
    private let _localeDataSource: CategoryLocaleDataSource
    private let _remoteDataSource: RemoteDataSource
    private let _mapper: Transformer
    
    public init(
        localeDataSource: CategoryLocaleDataSource,
        remoteDataSource: RemoteDataSource,
        mapper: Transformer) {
        
        _localeDataSource = localeDataSource
        _remoteDataSource = remoteDataSource
        _mapper = mapper
    }
    
    // 4
    public func execute(request: Any?) -> AnyPublisher<[CategoryModel], Error> {
        return _localeDataSource.list(request: nil)
            .map { _mapper.transformEntityToDomain(entity: $0) }
            .eraseToAnyPublisher()
    }
}
