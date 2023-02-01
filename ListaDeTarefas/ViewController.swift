//
//  ViewController.swift
//  ListaDeTarefas
//
//  Created by Felipe Augusto Correia on 01/02/23.
//

import UIKit

class ViewController: UITableViewController {
    
    var arrayTarefas: [String] = []
    
    // Instanciando TarefaUserDefaults
    let tarefaUserDefault = TarefaUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.barTintColor = .orange
        navigationController?.navigationBar.backgroundColor = .orange
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(adicionaNovaTarefa))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        atualizarListaDeTarefas()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTarefas.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let tarefa = TarefaUserDefaults()
            tarefa.remover(indice: indexPath.row)
            atualizarListaDeTarefas()
        }
        
    }
    
    func atualizarListaDeTarefas() {
        // Recebendo minha ARRAY
        arrayTarefas = tarefaUserDefault.listar()
        // Recarregar os dados
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaDeReuso = tableView.dequeueReusableCell(withIdentifier: "celulaDeReuso", for: indexPath)
        celulaDeReuso.textLabel?.text = arrayTarefas[indexPath.row]
        return celulaDeReuso
    }
    
    @objc func adicionaNovaTarefa() {
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
}

