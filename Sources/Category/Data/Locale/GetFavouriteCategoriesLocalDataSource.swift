//
//  File.swift
//  
//
//  Created by MacbookPro13 on 18/01/23.
//

import Core
import Combine
import RealmSwift
import Foundation

public struct GetFavouriteCategoriesLocaleDataSource: LocaleDataSource {
    
    public typealias Request = Any
    
    public typealias Response = CategoryEntity
    
    private let _realm: Realm
    
    public init(realm: Realm) {
        _realm = realm
    }
    
    // 1
    public func list(request: Any?) -> AnyPublisher<[CategoryEntity], Error> {
        return Future<[CategoryEntity], Error> { completion in
            let categories: Results<CategoryEntity> = {
              _realm.objects(CategoryEntity.self)
                    .filter("isFavourite = \(true)")
                .sorted(byKeyPath: "title", ascending: true)
            }()
            completion(.success(categories.toArray(ofType: CategoryEntity.self)))
          
        }.eraseToAnyPublisher()
    }

    // 2
    public func add(entities: [CategoryEntity]) -> AnyPublisher<Bool, Error> {
        fatalError()
    }
    
    // 3
    public func get(id: String) -> AnyPublisher<CategoryEntity, Error> {
        return Future<CategoryEntity, Error> { completion in
            if let categoryEntity = {
                _realm.objects(CategoryEntity.self).filter("id = '\(id)'")
            }().first {
                do {
                    try _realm.write {
                        categoryEntity.setValue(!categoryEntity.isFavorite, forKey: "isFavorite")
                    }
                    completion(.success(categoryEntity))
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    // 4
    public func update(id: String, entity: CategoryEntity) -> AnyPublisher<Bool, Error> {
        fatalError()
    }
}

