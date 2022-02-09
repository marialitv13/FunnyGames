//
//  PregameViewController.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 05.02.2022.
//

import UIKit

protocol PregameViewProtocol: AnyObject {
    func setupInitialState(_ gameCreatorModeOn: Bool, gameID: String)
    func updateView(with gameMembers: [String]?)
    func showErrorAlert(alertTitle: String)
}

class PregameViewController: UIViewController, PregameViewProtocol,  ModuleTransitionable {
    
    @IBOutlet weak var gameIDLabel: UILabel!
    @IBOutlet weak var gameDescLabel: UILabel!
    @IBOutlet weak var gameMembersTableView: UITableView!
    @IBOutlet weak var startButton: UIButton!
    
    var presenter: PregamePresenterProtocol?
    private var gameMembers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
    
    func setupInitialState(_ gameCreatorModeOn: Bool, gameID: String) {
        switch gameCreatorModeOn {
        case true:
            gameDescLabel.text = NSLocalizedString("GameCreatorDescTitle", comment: "")
        case false:
            gameDescLabel.text = NSLocalizedString("DefaultDescTitle", comment: "")
            startButton.isHidden = true
        }
        gameMembersTableView.separatorStyle = .none
        gameIDLabel.text = gameID
    }
    
    func updateView(with gameMembers: [String]?) {
        self.gameMembers = gameMembers ?? [String]()
        gameMembersTableView.reloadData()
    }
    
    func showErrorAlert(alertTitle: String) {
        showAlert(alertTitle: alertTitle)
    }
    
    @IBAction func didTapStartButton(_ sender: UIButton) {
        presenter?.startButtonTapped()
    }
    
}

extension PregameViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameMembers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.gameMemberID.rawValue) as! GameMemberCell
        cell.gameMemberLabel.text = "\(gameMembers[indexPath.row]) \(NSLocalizedString("JoinedGame", comment: ""))"
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        return cell
    }
    
}
