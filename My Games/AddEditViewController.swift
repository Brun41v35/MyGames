//
//  AddEditViewController.swift
//  My Games
//
//  Created by Bruno Alves da Silva on 02/07/20.
//  Copyright © 2020 Bruno Alves da Silva. All rights reserved.
//

import UIKit

class AddEditViewController: UIViewController {

    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfConsole: UITextField!
    @IBOutlet weak var dpReleaseDate: UIDatePicker!
    @IBOutlet weak var btAddEdit: UIButton!
    @IBOutlet weak var btCover: UIButton!
    @IBOutlet weak var ivCover: UIImageView!
    
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func AddEditCOver(_ sender: UIButton) {
        
    }
    
    @IBAction func AddEditiGame(_ sender: UIButton) {
        if game == nil {
            game = Game(context: context)
        }
        game.title = tfTitle.text
        game.releaseDate = dpReleaseDate.date
        
        //Persistindo dados
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        //Saindo da View Controller Atual
        navigationController?.popViewController(animated: true)
    }
}
