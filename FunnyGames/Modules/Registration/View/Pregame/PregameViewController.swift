//
//  PregameViewController.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 05.02.2022.
//

import UIKit

protocol PregameViewProtocol: AnyObject {
    func setupInitialState(gameID: String)
}

class PregameViewController: UIViewController, ModuleTransitionable, PregameViewProtocol {
    
    @IBOutlet weak var gameIDLabel: UILabel!
    @IBOutlet weak var gameMembersTableView: UITableView!

    var presenter: PregamePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
    
    func setupInitialState(gameID: String) {
        gameIDLabel.text = gameID
    }

}

//extension PregameViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//    }
//    
//    
//}
