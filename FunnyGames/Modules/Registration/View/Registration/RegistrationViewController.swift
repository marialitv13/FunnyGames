//
//  RegistrationViewController.swift
//  FunnyGames
//
//  Created by Maria Litvinenko on 30.01.2022.
//

import UIKit

/// Протокол с методами для реализации со стороны RegistrationViewController.
protocol RegistrationViewProtocol: AnyObject {
    func setupInitialState()
}

/// UI-класс для страницы регистрации техники.
class RegistrationViewController: UIViewController, RegistrationViewProtocol, ModuleTransitionable {
    
    var presenter: RegistrationPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
        navigationController?.isToolbarHidden = true
    }
    
    func setupInitialState() {
    }
    
    @IBAction func didTapJoinButton(_ sender: UIButton) {
    }
    
    @IBAction func didTapCreateNewButton(_ sender: UIButton) {
        presenter?.createNewGameButtonTapped()
    }
    
}
