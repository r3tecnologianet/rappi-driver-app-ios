//
//  InitialViewController.swift
//  RappiDriver
//
//  Created by Regis Araujo Melo on 29/03/24.
//  Copyright © 2024 R3Tecnologia.net. All rights reserved.
//

import UIKit
import RDComponents

class SummaryViewController: UIViewController {
    
    internal let newView: SummaryView = {
        let newView = SummaryView()
        newView.viewModel = SummaryViewModel()
        return newView
    }()
    
    lazy var dropDrow: RDDropdown = {
        let dropDrow = RDDropdown()
        return dropDrow
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()
        setupNavigation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.newView.animateCards()
    }

    private func setupUI() {
        view.backgroundColor = .white
    }
    
    private func loadData() {
        guard let viewModel = self.newView.viewModel else {
            return
        }
        
        viewModel.getSummary(personId: "123") { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                // Chama o método update() da view para atualizar a interface com os novos dados
                self.newView.update()
                self.showView(with: viewModel)
            case .failure(let error):
                debugPrint("Erro ao carregar dados: \(error)")
            }
        }
    }
    
    private func setupNavigation() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func showView(with model: SummaryViewModelProtocol) {

//            newView.delegate = self
            newView.viewModel = model
            view = newView
        }

}
