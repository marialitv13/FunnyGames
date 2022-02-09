//
//  GameViewController.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 09.02.2022.
//

import UIKit

import UIKit

protocol GameViewProtocol: AnyObject {
    func setupInitialState()
}

class GameViewController: UIViewController, ModuleTransitionable, GameViewProtocol {

    var presenter: GamePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
    
    func setupInitialState() {
    }
    
}
