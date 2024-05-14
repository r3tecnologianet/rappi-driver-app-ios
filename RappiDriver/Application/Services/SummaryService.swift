//
//  SummaryService.swift
//  RappiDriver
//
//  Created by Regis Araujo Melo on 13/05/24.
//  Copyright © 2024 R3Tecnologia.net. All rights reserved.
//

import Foundation

enum SummaryError: Error {
    case jsonDataNotFound
}

final class SummaryService: SummaryServiceProtocol {
    
    func findSummaryMessage(personId: String, 
                            completion: @escaping (Result<SummaryModelResponse, Error>) -> Void) {
        let jsonData = """
                [
                    {"title": "exemplo 1", "description": "meu texto de exemplo 1"},
                    {"title": "exemplo 2", "description": "meu texto de exemplo 2"},
                    {"title": "exemplo 3", "description": "meu texto de exemplo 3"}
                ]
                """.data(using: .utf8) ?? nil
        
        do {
            guard let jsonData = jsonData else {
                throw SummaryError.jsonDataNotFound
            }
            let summaryItems = try JSONDecoder().decode([SummaryItem].self, from: jsonData)
            let summaryResponse = SummaryModelResponse(summaryList: summaryItems)
            completion(.success(summaryResponse))
        } catch {
            debugPrint("Erro ao decodificar JSON: \(error)")
            completion(.failure(error))
        }
    }
    
}
