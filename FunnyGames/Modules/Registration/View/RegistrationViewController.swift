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
class RegistrationViewController: UIViewController, RegistrationViewProtocol {
    
    var presenter: RegistrationPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VIEW DID LOAD")
        presenter?.viewLoaded()
    }
    
    func setupInitialState() {
    }
    
}
