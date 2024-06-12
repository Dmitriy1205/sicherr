import UIKit
import Flutter
import flutter_local_notifications
import flutter_callkit_voximplant
import GoogleMaps

@UIApplicationMain
final class AppDelegate: FlutterAppDelegate {
  private let callKitPlugin = FlutterCallkitPlugin.sharedInstance
    
  @UserDefault("identifiedNumbers", defaultValue: [])
  private var identifiedNumbers: [IdentifiableNumber]
    
    
  func reloadExtension(){
      CXCallDirectoryManager.sharedInstance.reloadExtension(
          withIdentifier: "com.pandascode.sicher.CallerExtension",
          completionHandler: { error in
              if let error = error {
                  print("Error reloading Call Directory extension: \(error.localizedDescription)")
              } else {
                  print("Call Directory extension reloaded successfully.")
              }
          }
      )
  }
    
  override func application(

    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
  FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
      GeneratedPluginRegistrant.register(with: registry)
    }
    if #available(iOS 10.0, *) {
          UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
        }
    GMSServices.provideAPIKey("AIzaSyAbLBaDeytsTP5ih_W5DPzuJr84nR0Wo6E")
    GeneratedPluginRegistrant.register(with: self)
    callKitPlugin.didAddIdentifiablePhoneNumbers = { [weak self] numbers in
                  guard let self = self else { return }
                  self.identifiedNumbers.append(
                      contentsOf: numbers.map { IdentifiableNumber(identifiableNumber: $0) }
                  )
                  self.identifiedNumbers.sort()
        print("identified:" + String(identifiedNumbers.count));
                  reloadExtension()
              }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

fileprivate extension IdentifiableNumber {
    init(identifiableNumber: FCXIdentifiablePhoneNumber, removed: Bool = false) {
        self.number = identifiableNumber.number
        self.label = identifiableNumber.label
        self.modificationDate = Date()
        self.isRemoved = removed
    }

    var copyWithRemovalMark: IdentifiableNumber {
        IdentifiableNumber(
            number: number,
            label: label,
            modificationDate: Date(),
            isRemoved: true
        )
    }
}
