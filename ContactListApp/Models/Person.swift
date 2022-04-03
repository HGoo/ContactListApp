//
//  Person.swift
//  ContactListApp
//
//  Created by Николай Петров on 01.04.2022.
//

import Foundation

struct Person {
    var name: String
    var phone: String
    var surname: String?
    var imageData: Data?
    private(set) var date: Date?
    
    
    init(name: String, phone: String, imageData: Data? = nil) {
        self.name = name
        self.phone = phone
        self.imageData = imageData
        date = Date()
        
    }
    
    init(name: String, surname: String, phone: String, imagaData: Data? = nil) {
        self.name = name
        self.surname = surname
        self.phone = phone
        self.imageData = imagaData
        date = Date()
        
    }
}

extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.phone == rhs.phone
    }
}
