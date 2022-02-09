//
//  RegistrationViewController.swift
//  FunnyGames
//
//  Created by Maria Litvinenko on 30.01.2022.
//

import UIKit

protocol RegistrationViewProtocol: AnyObject {
    func setupInitialState()
}

class RegistrationViewController: UIViewController, RegistrationViewProtocol, ModuleTransitionable {
    
    var presenter: RegistrationPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
    
    func setupInitialState() {
        navigationController?.isToolbarHidden = true
    }
    
    @IBAction func didTapJoinButton(_ sender: UIButton) {
        presenter?.joinGameButtonTapped()
    }
    
    @IBAction func didTapCreateNewButton(_ sender: UIButton) {
        presenter?.createNewGameButtonTapped()
    }
    
}
