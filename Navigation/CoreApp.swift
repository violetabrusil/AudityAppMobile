//
//  CoreApp.swift
//
//
//  Created by Daniel Vera on 12/15/20.
//

import Foundation
import CoreData
import Combine

open class CoreAudityApp {
   
   public static let shared = CoreAudityApp()
   
   public var router: NeutralRouter = NeutralRouter()
   public var uiFactory: NeutralUIFactory = NeutralUIFactory()
    
   public init() {}
   
   public func configure(){
       
        
   }
    
   //Configuration for CoreData
//   public lazy var persistentContainer: NSPersistentContainer = {
//      guard let url = Bundle.module.url(forResource: "ewalletData", withExtension: "momd"),
//            let model = NSManagedObjectModel(contentsOf: url) else
//      {
//         fatalError("ewalletData Model not found")
//      }
//      let container = NSPersistentContainer(name: "ewalletData Model", managedObjectModel: model)
//      container.loadPersistentStores { _, error in
//         if let error = error as NSError? {
//            fatalError("Unresolved error \(error), \(error.userInfo)")
//         }
//      }
//      return container
//   }()
   
//   public lazy var context = persistentContainer.viewContext
//   public func saveContext() {
//      let context = persistentContainer.viewContext
//      if context.hasChanges {
//         do {
//            try context.save()
//         } catch {
//            let nserror = error as NSError
//            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//         }
//      }
//   }
}



