//
//  TarefaUserDefaults.swift
//  ListaDeTarefas
//
//  Created by Felipe Augusto Correia on 01/02/23.
//

import Foundation
import UIKit

class TarefaUserDefaults {
    
    let chave = "listaTarefas"
    
    var tarefas: [String] = []
    
    // RESUMINDO -> AO INVÉS DE VOCE ADICIONAR SOMENTE UM ITEM POR VEZ, QUE TODA A VEZ VAI SER SOBRESCREVIDO PELO ITEM MAIS RECENTE
    // É MELHOR SALVAR UMA ARRAY, QUE SEMPRE ESTARA SENDO ATUALIZADA COM O ITEM NOVO
    
    func salvar(tarefa: String) {
        
        // Antes de salvar as tarefas, temos que retornar
        tarefas = listar()
        
        // Salvando a TAREFA DENTRO DO ARRAY
        tarefas.append(tarefa)
        
        // Salvando o array com a nova tarefa
        UserDefaults.standard.set(tarefas, forKey: chave)
    }
    
    func listar() -> [String] {
        
        // Recuperando dados
        let dados = UserDefaults.standard.object(forKey: chave)
        
        if dados != nil {
            return dados as! [String]
        } else {
            return []
        }
    }
    
    func remover(indice: Int) {
        // Recupera a ARRAY
        tarefas = listar()
        
        // Exclui no indice que foi passado
        tarefas.remove(at: indice)
        
        // Salvando o array com a tarefa excluida
        UserDefaults.standard.set(tarefas, forKey: chave)
    }
}
