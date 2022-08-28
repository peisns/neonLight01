//
//  Model.swift
//  neonLight01
//
//  Created by Brother Model on 2022/08/28.
//

import UIKit
import RealmSwift

class Diary: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted var writeDate = Date()
    @Persisted var selectedDate = Date()
    @Persisted var title: String
    @Persisted var contents: String?

}
