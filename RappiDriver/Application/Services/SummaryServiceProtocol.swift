//
//  SummaryServiceProtocol.swift
//  RappiDriver
//
//  Created by Regis Araujo Melo on 13/05/24.
//  Copyright © 2024 R3Tecnologia.net. All rights reserved.
//

import Foundation

internal protocol SummaryServiceProtocol {
    func findSummaryMessage(personId: String,
                                completion: @escaping (Result<SummaryModelResponse, Error>) -> Void)
}
