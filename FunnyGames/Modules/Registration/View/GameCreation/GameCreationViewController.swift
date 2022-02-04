//
//  GameCreationViewController.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 04.02.2022.
//

import UIKit

protocol GameCreationViewProtocol: AnyObject {
    func setupInitialState()
}

class GameCreationViewController: UIViewController, GameCreationViewProtocol, ModuleTransitionable {
   
    @IBOutlet weak var identificatorTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
    var presenter: GameCreationPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
    
    func setupInitialState() {
        createButton.isEnabled = false
        nicknameTextField.delegate = self
    }
    
    @IBAction func didTapCreateButton(_ sender: UIButton) {
        presenter?.createNewGameButtonTapped(gameID: identificatorTextField.text ?? "", nickname: nicknameTextField.text ?? "")
    }
    
}

extension GameCreationViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text?.count == 1 && string == "" {
            createButton.isEnabled = false
        } else {
            createButton.isEnabled = true
        }
        return true
    }
    
}
