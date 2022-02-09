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
}

class PregameViewController: UIViewController, ModuleTransitionable, PregameViewProtocol {
  
    @IBOutlet weak var gameIDLabel: UILabel!
    @IBOutlet weak var gameDesc: UILabel!
    @IBOutlet weak var gameMembersTableView: UITableView!
    @IBOutlet weak var startButton: UIButton!
    
    var presenter: PregamePresenterProtocol?
    var gameMembers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
        gameMembersTableView.separatorStyle = .none
    }
    
    func setupInitialState(_ gameCreatorModeOn: Bool, gameID: String) {
        gameIDLabel.text = gameID
        switch gameCreatorModeOn {
        case true:
            gameDesc.text = NSLocalizedString("GameCreatorDescTitle", comment: "")
        default:
            gameDesc.text = NSLocalizedString("DefaultDescTitle", comment: "")
            startButton.isHidden = true
        }
    }

    func updateView(with gameMembers: [String]?) {
        self.gameMembers = gameMembers ?? [String]()
        gameMembersTableView.reloadData()
    }
    
    @IBAction func didTapStartButton(_ sender: UIButton) {
        presenter?.startButtonTapped()
    }

}

extension PregameViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameMembers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameMemberCell") as! GameMemberCell
        cell.gameMemberLabel.text = "\(gameMembers[indexPath.row]) в игре"
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        return cell
    }

}
