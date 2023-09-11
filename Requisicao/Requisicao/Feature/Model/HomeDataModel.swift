//
//  Data.swift
//  Requisicao
//
//  Created by Alysson on 09/09/23.
//

import Foundation


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let purpleData = try? JSONDecoder().decode(PurpleData.self, from: jsonData)

import Foundation

// MARK: - 
struct HomeDataModel: Codable {
    var totalValue: Double?
    var historyAccountList: [HistoryAccountList]?
}

// MARK: - HistoryAccountList
struct HistoryAccountList: Codable {
    var historyID, date, name: String?
    var price: Double?
    var iconImage: String?
}
