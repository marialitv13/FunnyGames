//
//  GameCreationViewController.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 04.02.2022.
//

import UIKit

class GameCreationViewController: UIViewController {

    @IBOutlet weak var gameParametersTableView: UITableView!
    
    let cellReuseIdentifier = "GameParameterCell"
    let titles = ["Придумайте идентификатор для входа в игру:", "Придумайте никнейм:"]
    let subtitles = ["Можете оставить это поле пустым - мы сгенерируем его автоматически.", "Обязательно. Ваш никнейм будут видеть ваши друзья."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameParametersTableView.separatorStyle = .none
    }

}

extension GameCreationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! GameParameterCell
        cell.titleLabel.text = titles[indexPath.row]
        cell.subtitleLabel.text = subtitles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    
}
