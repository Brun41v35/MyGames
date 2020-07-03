//
//  ViewController+CoreData.swift
//  My Games
//
//  Created by Bruno Silva on 02/07/20.
//  Copyright © 2020 Bruno Alves da Silva. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension UIViewController {
    
    //Recuperando o contexto
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
