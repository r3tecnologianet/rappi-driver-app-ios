//
//  SummaryViewModel.swift
//  RappiDriver
//
//  Created by Regis Araujo Melo on 13/05/24.
//  Copyright © 2024 R3Tecnologia.net. All rights reserved.
//

import Foundation

protocol SummaryViewModelProtocol {
    var continueButtonText: String { get }
    var skipButtonText: String { get }
    var titleSceen: String { get }
    var listCard: [SummaryItem] { get }
    func getSummary(personId: String, completion: @escaping (Result<[SummaryItem], Error>) -> Void)
}

final class SummaryViewModel: SummaryViewModelProtocol {
    
    var continueButtonText: String
    var skipButtonText: String
    var titleSceen: String
    var listCard: [SummaryItem]
    
    private var service: SummaryServiceProtocol
    
    init() {
        self.continueButtonText = "Continuar"
        self.skipButtonText = "Agora não"
        self.titleSceen = "Tela de Resumo"
        self.listCard = []
        self.service = SummaryService()
    }
    
    func getSummary(personId: String, completion: @escaping (Result<[SummaryItem], Error>) -> Void) {
        service.findSummaryMessage(personId: "123", completion: { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.listCard = success.summaryList
                    completion(.success(success.summaryList))
                }
            case .failure(let failure):
                debugPrint(failure.localizedDescription)
            }
        })
    }
    
}
