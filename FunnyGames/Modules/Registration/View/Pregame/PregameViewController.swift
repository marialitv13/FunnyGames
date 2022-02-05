//
//  PregameViewController.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 05.02.2022.
//

import UIKit

protocol PregameViewProtocol: AnyObject {
    func setupInitialState()
}

class PregameViewController: UIViewController, ModuleTransitionable, PregameViewProtocol {
    
    @IBOutlet weak var gameIDLabel: UILabel!
    
    var presenter: PregamePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
    
    func setupInitialState() {
    }

}
