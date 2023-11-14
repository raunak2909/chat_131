import UIKit
import Flutter
import flutter_local_notifications
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyDw4Bppdwk-8gtwM4i8gLBSsTpDyJvYGQM")
    GeneratedPluginRegistrant.register(with: self)
    if #available(iOS 10.0, *) {
  UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
}
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
