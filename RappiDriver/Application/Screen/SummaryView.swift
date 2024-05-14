//
//  SummaryView.swift
//  RappiDriver
//
//  Created by Regis Araujo Melo on 13/05/24.
//  Copyright © 2024 R3Tecnologia.net. All rights reserved.
//

import UIKit
import RDComponents

class SummaryView: UIView {
    
    lazy var cardStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var header: RDHeader = {
        let header = RDHeader()
        header.setTitle("Hello !!!")
        header.setsubtitleLabel("Please enter the 4-digit code sent to you at +55 348 8877")
        header.backgroundColor = .clear
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    lazy var continueButton: RDButton = {
        let button = RDButton(variant: .secondary)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitle("My Button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var skipButton: RDButton = {
        let button = RDButton(variant: .primary)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.setTitle("My Button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        return button
    }()

    internal var viewModel: SummaryViewModelProtocol? {
        didSet {
            update()
        }
    }
    
    internal override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    @available(*, unavailable)
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    internal func update() {
        guard let model = viewModel else {
            return
        }
        cardStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for item in model.listCard {
            let card = CardView()
            card.configure(with: item.title, description: item.description)
            cardStackView.addArrangedSubview(card)
        }
        
        self.continueButton.setTitle(model.continueButtonText, for: .normal)
        self.skipButton.setTitle(model.skipButtonText, for: .normal)
    }
    
    func animateCards() {
        let screenHeight = UIScreen.main.bounds.height
        
        for (index, card) in cardStackView.arrangedSubviews.enumerated() {
            // Inicialmente, os cards estarão abaixo do limite inferior da tela
            card.transform = CGAffineTransform(translationX: 0, y: screenHeight)
            
            // Calcula o atraso para este card
            let delay = 0.1 * Double(index)
            
            // Anima o card com um atraso
            UIView.animate(withDuration: 0.7, delay: delay, options: .curveEaseOut, animations: {
                card.transform = .identity
            }, completion: nil)
        }
    }
    
    private func setupView() {
        backgroundColor = .lightGray
        addSubview(header)
        addSubview(cardStackView)
        addSubview(continueButton)
        addSubview(skipButton)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: self.topAnchor),
            header.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            continueButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, 
                                                    constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                     constant: -20),
            continueButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
                                                   constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            skipButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, 
                                                constant: 20),
            skipButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, 
                                                 constant: -20),
            skipButton.bottomAnchor.constraint(equalTo: continueButton.topAnchor, 
                                               constant: -20),
            skipButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            cardStackView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20),
            cardStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            cardStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            cardStackView.bottomAnchor.constraint(lessThanOrEqualTo: continueButton.topAnchor, constant: -20)
        ])
        
    }

}
