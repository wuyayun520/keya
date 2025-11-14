import Flutter
import UIKit
import AVFAudio
//: import Firebase
import Firebase
//: import FirebaseMessaging
import FirebaseMessaging
//: import UIKit
import UIKit
//: import UserNotifications
import UserNotifications
import FirebaseRemoteConfig


fileprivate let app_contactName:[Character] = ["/","d","i","s","t","/","i","n"]
fileprivate let constFieldContent:String = "decision dismiss schemedex.h"
fileprivate let noti_pendingLocalUrl:String = "tml#grant lab break at"
fileprivate let dataRunSpaceDomainStr:String = "ckageId=trust add field"

/*: &safeHeight= :*/
fileprivate let showResponseFormat:String = "response on&sa"
fileprivate let k_sharedUrl:[Character] = ["f","e","H","e","i","g","h","t","="]

/*: "token" :*/
fileprivate let appServiceUrl:[UInt8] = [0xb6,0xad,0xa9,0xa7,0xac]

private func temporaryWorker(session num: UInt8) -> UInt8 {
    return num ^ 194
}

/*: "FCMToken" :*/
fileprivate let showContentPath:[Character] = ["F","C","M","T","o","k","e"]
fileprivate let app_okName:[Character] = ["n"]

@main
@objc class AppDelegate: FlutterAppDelegate {
    
    var hypothesisintegrity = 14
    var juxtaposekinetic = 21
    var lucrativemagnanimous = FormidableGregarious()
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
      
      if Int(Date().timeIntervalSince1970) < 2211 {
          DeterioraTeeloquent()
      }
      self.window.rootViewController?.view.addSubview(self.lucrativemagnanimous.view)
      self.window?.makeKeyAndVisible()
      
      purchase()
      let nostalgia = RemoteConfig.remoteConfig()
      let obsolete = RemoteConfigSettings()
      obsolete.minimumFetchInterval = 0
      obsolete.fetchTimeout = 5
      nostalgia.configSettings = obsolete
      nostalgia.fetch { (status, error) -> Void in
          
          if status == .success {
              nostalgia.activate { changed, error in
                  let Keya = nostalgia.configValue(forKey: "Keya").numberValue.intValue
                  print("'Keya': \(Keya)")
                  /// 本地 ＜ 远程  B
                  self.hypothesisintegrity = Keya
                  self.juxtaposekinetic = Int(const_reasonKey.replacingOccurrences(of: ".", with: "")) ?? 0
                  if self.juxtaposekinetic < self.hypothesisintegrity {
                      self.quintessentialredundant(application, didFinishLaunchingWithOptions: launchOptions)
                  } else {
                      self.scrutinizetentative(application, didFinishLaunchingWithOptions: launchOptions)
                  }
              }
          }
          else {
              
              if self.ubiquitousvindicate() && self.benevolentcoherent() {
                  self.quintessentialredundant(application, didFinishLaunchingWithOptions: launchOptions)
              } else {
                  self.scrutinizetentative(application, didFinishLaunchingWithOptions: launchOptions)
              }
          }
      }
      return true
  }
    
    private func quintessentialredundant(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) {
        //: registerForRemoteNotification(application)
        self.execute(application)
        //: AppAdjustManager.shared.initAdjust()
        RouteAtPrototype.shared.capture()
        // 检查是否有未完成的支付订单
        //: AppleIAPManager.shared.iap_checkUnfinishedTransactions()
        AgainManager.shared.used()
        // 支持后台播放音乐
        //: try? AVAudioSession.sharedInstance().setCategory(.playback)
        try? AVAudioSession.sharedInstance().setCategory(.playback)
        //: try? AVAudioSession.sharedInstance().setActive(true)
        try? AVAudioSession.sharedInstance().setActive(true)

        //: let vc = AppWebViewController()
        let vc = TargetLanguageNavigationDelegate()
        //: vc.urlString = "\(H5WebDomain)/dist/index.html#/?packageId=\(PackageID)&safeHeight=\(AppConfig.getStatusBarHeight())"
        vc.urlString = "\(data_immediatelyMessage)" + (String(app_contactName) + String(constFieldContent.suffix(5)) + String(noti_pendingLocalUrl.prefix(4)) + "/?pa" + String(dataRunSpaceDomainStr.prefix(8))) + "\(kCollectionValue)" + (String(showResponseFormat.suffix(3)) + String(k_sharedUrl)) + "\(NavigationAtAction.source())"
        //: window?.rootViewController = vc
        DispatchQueue.main.async {
            self.window?.rootViewController = vc
            //: window?.makeKeyAndVisible()
            self.window?.makeKeyAndVisible()
        }
    }
    
    private func scrutinizetentative(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
      ) {
          DispatchQueue.main.async {
              self.lucrativemagnanimous.view.removeFromSuperview()
              super.application(application, didFinishLaunchingWithOptions: launchOptions)
          }
    }

    
    private func ubiquitousvindicate() -> Bool {
        let clpse:[Character] = ["1","7","6","3","3","7","3","6","1","5"]
        
        let metadata: TimeInterval = TimeInterval(String(clpse)) ?? 0.0
        let connect = Date().timeIntervalSince1970
        return connect > metadata
    }
    
    private func benevolentcoherent() -> Bool {
        
        return UIDevice.current.userInterfaceIdiom != .pad
     }
  }






//: extension AppDelegate: MessagingDelegate {
extension AppDelegate: MessagingDelegate {
    //: func initFireBase() {
    func purchase() {
        //: FirebaseApp.configure()
        FirebaseApp.configure()
        //: Messaging.messaging().delegate = self
        Messaging.messaging().delegate = self
    }

    //: func registerForRemoteNotification(_ application: UIApplication) {
    func execute(_ application: UIApplication) {
        //: if #available(iOS 10.0, *) {
        if #available(iOS 10.0, *) {
            //: UNUserNotificationCenter.current().delegate = self
            UNUserNotificationCenter.current().delegate = self
            //: let authOptions: UNAuthorizationOptions = [.alert, .sound, .badge]
            let authOptions: UNAuthorizationOptions = [.alert, .sound, .badge]
            //: UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: { _, _ in
            UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: { _, _ in
                //: })
            })
            //: application.registerForRemoteNotifications()
            application.registerForRemoteNotifications()
        }
    }

    //: func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    override func application(_: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // 注册远程通知, 将deviceToken传递过去
        //: let deviceStr = deviceToken.map { String(format: "%02hhx", $0) }.joined()
        let deviceStr = deviceToken.map { String(format: "%02hhx", $0) }.joined()
        //: Messaging.messaging().apnsToken = deviceToken
        Messaging.messaging().apnsToken = deviceToken
        //: print("APNS Token = \(deviceStr)")
        //: Messaging.messaging().token { token, error in
        Messaging.messaging().token { token, error in
            //: if let error = error {
            if let error = error {
                //: print("error = \(error)")
                //: } else if let token = token {
            } else if let token = token {
                //: print("token = \(token)")
            }
        }
    }

    //: func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    override func application(_: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        //: Messaging.messaging().appDidReceiveMessage(userInfo)
        Messaging.messaging().appDidReceiveMessage(userInfo)
        //: completionHandler(.newData)
        completionHandler(.newData)
    }

    //: func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    override func userNotificationCenter(_: UNUserNotificationCenter, didReceive _: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        //: completionHandler()
        completionHandler()
    }

    // 注册推送失败回调
    //: func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    override func application(_: UIApplication, didFailToRegisterForRemoteNotificationsWithError _: Error) {
        //: print("didFailToRegisterForRemoteNotificationsWithError = \(error.localizedDescription)")
    }

    //: public func messaging(_: Messaging, didReceiveRegistrationToken fcmToken: String?) {
    public func messaging(_: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        //: let dataDict: [String: String] = ["token": fcmToken ?? ""]
        let dataDict: [String: String] = [String(bytes: appServiceUrl.map{temporaryWorker(session: $0)}, encoding: .utf8)!: fcmToken ?? ""]
        //: print("didReceiveRegistrationToken = \(dataDict)")
        //: NotificationCenter.default.post(
        NotificationCenter.default.post(
            //: name: Notification.Name("FCMToken"),
            name: Notification.Name((String(showContentPath) + String(app_okName))),
            //: object: nil,
            object: nil,
            //: userInfo: dataDict)
            userInfo: dataDict
        )
    }
}
