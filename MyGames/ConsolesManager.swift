//
//  ConsolesManager.swift
//  MyGames
//
//  Created by School Picture Dev on 21/05/18.
//  Copyright © 2018 Joao Rocha. All rights reserved.
//

import CoreData

class ConsolesManager {
    static let shared = ConsolesManager()
    
    var consoles: [Console] = []
    
    func loadConsoles(with context: NSManagedObjectContext) {
        
        let fetchRequest: NSFetchRequest<Console> = Console.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            consoles = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private init() {
    
    }
    
    func deleteConsole(index : Int, context: NSManagedObjectContext) {
        let console = consoles[index]
        context.delete(console)
        
        do {
            consoles.remove(at: index)
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
