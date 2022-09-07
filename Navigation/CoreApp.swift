////
////  CoreApp.swift
////
////
////  Created by Daniel Vera on 12/15/20.
////
//
//import Foundation
//import CoreData
//import Combine
//
//open class CoreApp {
//   
//   public static let shared = CoreApp()
//   
//   public var settings: NetworkSettings!
//   public var uiFactory = UIFactory()
//   public var neutralUiFactory = NeutralUIFactory()
//   public var notificationService: NotificationService? = nil
//   public var ageOfMajority: Int = 18
//   public var serverCerts: [LocalFile] = [LocalFile(name: "dst", fileExtension: "der")]
//   public var overrideCerts: Bool = false
//   public var currentRouter: Router = Router()
//   public var router: NeutralRouter = NeutralRouter()
//   public var currentPaymentInformationDTO: CurrentPaymentInformationDTO = CurrentPaymentInformationDTO()
//   public var expirationDate: Date = Date()
//   @Published public var keyboardShown : Bool = false
//   public var defaultCountryIndex: Int = DefaultCountryCode.COUNTRY_PICKER_SELECTOR.rawValue
//   public var currencyHelper: CurrencyHelper = CurrencyHelper()
//   public var termsAndConditionsFile = LocalFile(name: "tc", fileExtension: "md")
//   public var shareType: ShareType = ShareType.PDF
//   public var flowType: Flow = Flow.LOGIN
//   @Published public var shouldRefreshTransactionList: Bool = false
//   @Published public var showInfoToast: Bool = false
//   
//   public init() {}
//   
//   public func configure(settings: NetworkSettings, uiFactory: UIFactory = UIFactory(), neutralUiFactory: NeutralUIFactory = NeutralUIFactory(), serverCertificates: [LocalFile]? = nil, defaultCountryIndex: Int? = nil, notificationService: NotificationService? = nil, shareType: ShareType? = ShareType.PDF) {
//      self.settings = settings
//      self.uiFactory = uiFactory
//      self.neutralUiFactory = neutralUiFactory
//      self.notificationService = notificationService
//      if let cert = serverCertificates {
//         self.overrideCerts = true
//         self.serverCerts = cert
//      }
//      if let newCountryCode = defaultCountryIndex {
//         self.defaultCountryIndex = newCountryCode
//      }
//      if let shareType = shareType {
//         self.shareType = shareType
//      }
//   }
//   
//   //Configuration for CoreData
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
//   
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
//}
//
//public struct NetworkSettings {
//   
//   private let httpProtocol: String
//   private let baseURL: String
//   
//   public init(httpProtocol: String, baseURL: String) {
//      self.httpProtocol = httpProtocol
//      self.baseURL = baseURL
//   }
//   
//   public func getURL() -> NSURLComponents {
//      return NSURLComponents(string: httpProtocol + "://" + baseURL)!
//   }
//}
//
//public struct LocalFile {
//   public var name: String
//   public var fileExtension: String
//   public var overriden: Bool = false
//   
//   public init(name: String, fileExtension: String, overriden: Bool? = false){
//      self.name = name
//      self.fileExtension = fileExtension
//      if let overridenValue = overriden {
//         self.overriden = overridenValue
//      }
//   }
//}
