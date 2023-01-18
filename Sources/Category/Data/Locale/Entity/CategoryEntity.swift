//
//  File.swift
//  
//
//  Created by MacbookPro13 on 11/01/23.
//

import Foundation
import RealmSwift

public class CategoryEntity: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var isFavorite: Bool = false
    
    public override static func primaryKey() -> String? {
        return "id"
    }
}
