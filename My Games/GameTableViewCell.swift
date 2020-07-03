//
//  GameTableViewCell.swift
//  My Games
//
//  Created by Bruno Alves da Silva on 02/07/20.
//  Copyright © 2020 Bruno Alves da Silva. All rights reserved.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivCover: UIImageView!
    @IBOutlet weak var lbConsole: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepare(with game: Game) {
        lbTitle.text = game.title
        lbConsole.text = game.console?.name
        if let image = game.cover as? UIImage {
            ivCover.image = image
        } else {
            ivCover.image = UIImage(named: "noCover")
        }
    }

}
