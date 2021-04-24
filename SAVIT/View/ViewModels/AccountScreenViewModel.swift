//
//  AccountScreenViewModel.swift
//  SAVIT
//
//  Created by Reda on 24/03/2021.
//  Copyright © 2021 Reda. All rights reserved.
//

import Foundation
 
class AccountScreenModel {
    public var accountArray = [Account]()
    
    func connectToDatabase() {
        _ = SQliteDatabase.sharedInstance
    }
    func loadDataFromSQLiteDatabase(){
        accountArray = SQLiteCommands.presentRow() ?? []
    }
    func numberOfRowInsection ( section : Int) -> Int {
        if accountArray.count != 0 {
            return accountArray.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath : IndexPath ) -> Account {
        return accountArray[indexPath.row]
    }
}
