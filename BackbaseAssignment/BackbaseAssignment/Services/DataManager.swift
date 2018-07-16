//
//  DataManager.swift
//  BackbaseAssignment
//
//  Created by Abdul Aljebouri on 2018-07-13.
//  Copyright © 2018 aljebouri. All rights reserved.
//

import Foundation

class DataManager {
    private let bookmarkedCitiesKey = "bookmarkedCities"
    
    static let shared = DataManager()
    
    private(set) var bookmaredCities:[BookmarkedCity] = []
    
    private init() {
        let userDefaults = UserDefaults.standard
        
        let bookmarkedCitiesSaved = userDefaults.object(forKey: bookmarkedCitiesKey)
        if let bookmarkedCitiesSaved = bookmarkedCitiesSaved as? NSData {
            let unarchivedData = NSKeyedUnarchiver.unarchiveObject(with: bookmarkedCitiesSaved as Data) as? [BookmarkedCity]
            bookmaredCities = unarchivedData!
        }
    }
    
    func addBookmarkedCity(_ bookmarkedCity:BookmarkedCity) {
        bookmaredCities.append(bookmarkedCity)
        
        storeInUserDefaults()
    }
    
    func removeBookmarkedCity(_ bookmarkedCity:BookmarkedCity) {
        let index = bookmaredCities.index(of: bookmarkedCity)
        
        if let index = index {
            bookmaredCities.remove(at: index)
        }
        
        storeInUserDefaults()
    }
    
    private func storeInUserDefaults() {
        let userDefaults = UserDefaults.standard
        let archivedObject = NSKeyedArchiver.archivedData(withRootObject: bookmaredCities as NSArray) as NSData
        userDefaults.set(archivedObject, forKey: bookmarkedCitiesKey)
        userDefaults.synchronize()
    }
}
