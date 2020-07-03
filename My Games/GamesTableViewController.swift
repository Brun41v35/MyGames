//
//  GamesTableViewController.swift
//  My Games
//
//  Created by Bruno Alves da Silva on 02/07/20.
//  Copyright © 2020 Bruno Alves da Silva. All rights reserved.
//

import UIKit
import CoreData

class GamesTableViewController: UITableViewController {
    
    //Criando uma variavel do tipo NSFetchedResultsController = Responsavel pela busca dos conteudos
    //Essa classe da acesso a fazer uma pesquisa
    var fetchedResultController: NSFetchedResultsController<Game>!
    
    var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Voce nao tem jogo cadastrado"
        label.textAlignment = .center
        loadGames()
    }
    
    //Funcao responsavel em carregar os dados
    func loadGames() {
        
        //Necessario a importacao do CoreData
        let solicitacao: NSFetchRequest<Game> = Game.fetchRequest()
        
        //Utilizando o NSSortDescriptor conseguimos ordenar a forma que os jogos irao aparecer
        //No exemplo abaixo, vamos ordenar pelo titulo
        let ordenacaoTitulo = NSSortDescriptor(key: "title", ascending: true)
        
        //Nesse momento estamos passando a nossa ordenacao para o fetchRequest
        //E possivel criar mais de uma ordenacao
        solicitacao.sortDescriptors = [ordenacaoTitulo]
        
        
        fetchedResultController = NSFetchedResultsController(fetchRequest: solicitacao, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController.delegate = self
        
        do {
            try fetchedResultController.performFetch()
        } catch {
            print(error.localizedDescription)
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let count = fetchedResultController.fetchedObjects?.count ?? 0
        
        tableView.backgroundView = count == 0 ? label : nil
        
        return count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GameTableViewCell
        
        guard let game = fetchedResultController.fetchedObjects?[indexPath.row] else {
            return cell
        }
        
        cell.prepare(with: game)
        
        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GamesTableViewController: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
            case .delete:
                break
            default:
                tableView.reloadData()
        }
    }
}
