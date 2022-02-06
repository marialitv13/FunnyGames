//
//  GameCreationViewController.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 04.02.2022.
//

import UIKit

protocol LogInViewProtocol: AnyObject {
    func setupInitialState(createNewGameMode: Bool)
    func showErrorAlert(alertTitle: String)
}

class LogInViewController: UIViewController, LogInViewProtocol, ModuleTransitionable {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var idSubtitleLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var nicknameSubtitleLabel: UILabel!
    @IBOutlet weak var identificatorTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
    var presenter: LogInPresenterProtocol?
    var createNewGameMode: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
    
    func setupInitialState(createNewGameMode: Bool) {
        if createNewGameMode == true {
            setupNewGameMode()
        } else {
            setupJoinMode()
        }
        createButton.isEnabled = false
        nicknameTextField.delegate = self
    }
    
    private func setupNewGameMode() {
        idLabel.text = NSLocalizedString("CreateGameModeIdTitle", comment: "")
        idSubtitleLabel.text = NSLocalizedString("CreateGameModeIdSubtitle", comment: "")
        createButton.setTitle(NSLocalizedString("CreateGameModeButton", comment: ""), for: .normal)
    }
    
    private func setupJoinMode() {
        idLabel.text = NSLocalizedString("JoinGameModeIdTitle", comment: "")
        idSubtitleLabel.text = NSLocalizedString("JoinGameModeIdSubtitle", comment: "")
        createButton.setTitle(NSLocalizedString("JoinGameModeButton", comment: ""), for: .normal)
    }
    
    func showErrorAlert(alertTitle: String) {
        let alert = UIAlertController(title: alertTitle, message: NSLocalizedString("AlertSubtitle", comment: ""), preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func didTapCreateButton(_ sender: UIButton) {
        presenter?.buttonTapped(gameID: identificatorTextField.text ?? "", nickname: nicknameTextField.text ?? "")
    }
        
}

extension LogInViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text?.count == 1 && string == "" {
            createButton.isEnabled = false
        } else {
            createButton.isEnabled = true
        }
        return true
    }
    
}
