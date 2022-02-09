//
//  GameMemberCell.swift
//  FunnyGames
//
//  Created by Mariya Litvinenko on 08.02.2022.
//

import UIKit

class GameMemberCell: UITableViewCell {
    
    @IBOutlet weak var gameMemberLabel: UILabel!
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 10
            frame.origin.x += 10
            frame.size.height -= 5
            frame.size.width -= 2 * 20
            super.frame = frame
        }
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        layer.masksToBounds = false
    }
    
}
