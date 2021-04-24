//
//  DataBaseLayer.swift
//  SAVIT
//
//  Created by Reda on 23/03/2021.
//  Copyright © 2021 Reda. All rights reserved.
//

import Foundation
import SQLite

class SqliteDatabase {
    
   static let sharedInstance = SqliteDatabase()
    
    var database : Connection?
    
    private init () {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask , appropriateFor : nil , create : true)
            
            let fileUrl = documentDirectory.appendingPathComponent("SAVIT").appendingPathExtension("sqlite3")
            
            database = try Connection(fileUrl.path)
            
        } catch {
            print(error)
        }
    }
    
    func createTable () {
        
    }
}


