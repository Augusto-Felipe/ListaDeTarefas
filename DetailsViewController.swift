//
//  DetailsViewController.swift
//  ListaDeTarefas
//
//  Created by Felipe Augusto Correia on 01/02/23.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet var tarefaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func botaoAdicionarTarefaPressionado(_ sender: UIButton) {
        if let textoDigitado = tarefaTextField.text {
            
            // Vamos salvar os dados aqui e listar na outra página
            // Vamos criar uma classe para salvar e listar os dados
            let tarefa = TarefaUserDefaults()
            tarefa.salvar(tarefa: textoDigitado)
            tarefaTextField.text = ""
        }
    }
}
