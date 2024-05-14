//
//  SummaryModel.swift
//  RappiDriver
//
//  Created by Regis Araujo Melo on 13/05/24.
//  Copyright © 2024 R3Tecnologia.net. All rights reserved.
//

import Foundation

internal struct SummaryModelResponse: Codable {

    // MARK: - Properties

    internal var summaryList: [SummaryItem]

    internal enum CodingKeys: String, CodingKey {
        case summaryList = "summary_list"
    }

}

struct SummaryItem: Codable {
    let title: String
    let description: String
}
