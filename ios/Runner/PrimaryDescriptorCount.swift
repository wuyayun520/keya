
//: Declare String Begin

/*: "typeName" :*/
fileprivate let notiPendingPath:[UInt8] = [0xeb,0xe6,0xef,0xfa,0xd1,0xfe,0xf2,0xfa]

private func presentDismiss(zone num: UInt8) -> UInt8 {
    return num ^ 159
}

/*: "deviceID" :*/
fileprivate let showDailyTitle:[UInt8] = [0xab,0xaa,0xb9,0xa6,0xac,0xaa,0x86,0x8b]

/*: "fireBaseID" :*/
fileprivate let noti_backgroundTitle:[UInt8] = [0x22,0x2d,0x36,0x21,0x6,0x25,0x37,0x21,0xd,0x0]

private func whiteLet(input num: UInt8) -> UInt8 {
    return num ^ 68
}

/*: "areaISO" :*/
fileprivate let showWithName:[UInt8] = [0xa4,0xb7,0xa0,0xa4,0x8c,0x96,0x8a]

private func upDailyProcess(to num: UInt8) -> UInt8 {
    return num ^ 197
}

/*: "isProxy" :*/
fileprivate let show_enterName:[UInt8] = [0x97,0x8d,0xae,0x8c,0x91,0x86,0x87]

/*: "langCode" :*/
fileprivate let mainMessageData:[UInt8] = [0x35,0x2a,0x37,0x30,0xc,0x38,0x2d,0x2e]

fileprivate func filterBlock(text num: UInt8) -> UInt8 {
    let value = Int(num) - 201
    if value < 0 {
        return UInt8(value + 256)
    } else {
        return UInt8(value)
    }
}

/*: "timeZone" :*/
fileprivate let appSystemData:[UInt8] = [0xb0,0xad,0xa9,0xa1,0x9e,0xab,0xaa,0xa1]

private func levelObject(normal num: UInt8) -> UInt8 {
    return num ^ 196
}

/*: "installedApps" :*/
fileprivate let userMagnitudeFileStr:[UInt8] = [0x4c,0x4b,0x56,0x51,0x44,0x49,0x49,0x40,0x41,0x64,0x55,0x55,0x56]

private func loadActive(head num: UInt8) -> UInt8 {
    return num ^ 37
}

/*: "systemUUID" :*/
fileprivate let notiAreaStr:[UInt8] = [0x66,0x6c,0x66,0x61,0x70,0x78,0x40,0x40,0x5c,0x51]

private func decideHandle(put num: UInt8) -> UInt8 {
    return num ^ 21
}

/*: "countryCode" :*/
fileprivate let const_fieldSucceedMsg:[UInt8] = [0x65,0x64,0x6f,0x43,0x79,0x72,0x74,0x6e,0x75,0x6f,0x63]

/*: "status" :*/
fileprivate let appProductionMessage:[UInt8] = [0x35,0x36,0x23,0x36,0x37,0x35]

fileprivate func asApplicationCount(observer num: UInt8) -> UInt8 {
    let value = Int(num) - 194
    if value < 0 {
        return UInt8(value + 256)
    } else {
        return UInt8(value)
    }
}

/*: "isAuth" :*/
fileprivate let userProductionData:[UInt8] = [0x68,0x74,0x75,0x41,0x73,0x69]

/*: "isFirst" :*/
fileprivate let data_requestMsg:[UInt8] = [0x46,0x5c,0x69,0x46,0x5d,0x5c,0x5b]

private func toolAt(vertical num: UInt8) -> UInt8 {
    return num ^ 47
}

/*: __LocalPush" :*/
fileprivate let show_thatData:String = "display privacy show break purchase__LocalP"
fileprivate let const_localFormat:String = "usession"

/*: "identifier" :*/
fileprivate let dataSharedTitle:[UInt8] = [0x4f,0x42,0x43,0x48,0x52,0x4f,0x40,0x4f,0x43,0x54]

private func showAccess(succeed num: UInt8) -> UInt8 {
    return num ^ 38
}

/*: "HTTPProxy" :*/
fileprivate let appCameraServiceUrl:[Character] = ["H","T","T","P","P","r","o"]
fileprivate let kBounceName:[Character] = ["x","y"]

/*: "HTTPSProxy" :*/
fileprivate let k_accessData:String = "first clear ratingHTTPSPr"
fileprivate let k_rawName:[Character] = ["o","x","y"]

/*: "SOCKSProxy" :*/
fileprivate let show_revenueValue:[Character] = ["S","O","C","K","S","P","r"]
fileprivate let app_contentData:String = "permissionxy"

/*: "__SCOPED__" :*/
fileprivate let const_stopLinkSearchData:String = "__SCObackground after start"

/*: "tap" :*/
fileprivate let noti_userFormat:[Character] = ["t","a","p"]

/*: "tun" :*/
fileprivate let constRequestId:String = "tuprotection"

/*: "ipsec" :*/
fileprivate let const_canData:String = "IPSEC"

/*: "ppp" :*/
fileprivate let userBackgroundId:String = "launchp"

/*: "Retry After or Go to " :*/
fileprivate let constProgressValue:String = "Retry Apath available reason mask user"
fileprivate let mainWhiteText:[Character] = ["f","t","e","r"," ","o","r"," ","G"]
fileprivate let showBounceFormat:String = "media now captureo to "

/*: "Feedback" :*/
fileprivate let noti_clearCenterPath:String = "Feedisappear record with"
fileprivate let data_documentFireKey:String = "dbdisappeark"

/*: " to contact us" :*/
fileprivate let show_contactWhiteName:[Character] = [" ","t","o"," ","c","o","n","t","a"]
fileprivate let noti_takeMessage:[Character] = ["c","t"," ","u","s"]

//: Declare String End

// __DEBUG__
// __CLOSE_PRINT__
//
//  PrimaryDescriptorCount.swift
//  OverseaH5
//
//  Created by young on 2025/9/23.
//

//: import CoreTelephony
import CoreTelephony
//: import FirebaseMessaging
import FirebaseMessaging
//: import HandyJSON
import HandyJSON
//: import StoreKit
import StoreKit
//: import UIKit
import UIKit

//: enum TypeName: String, HandyJSONEnum {
enum CombineUTF8Initializable: String, HandyJSONEnum {
    //: case unDefaultMethod = "unDefaultMethod"    // 未定义方法
    case unDefaultMethod // 未定义方法
    //: case getDeviceID     = "getDeviceID"        // 获取设备号
    case getDeviceID // 获取设备号
    //: case getFireBaseID   = "getFirebaseID"      // 获取FireBaseToken
    case getFireBaseID = "getFirebaseID" // 获取FireBaseToken
    //: case getAreaISO      = "getAreaISO"         // 获取 SIM/运营商 地区ISO
    case getAreaISO // 获取 SIM/运营商 地区ISO
    //: case getProxyStatus  = "getProxyStatus"     // 获取是否使用了代理
    case getProxyStatus // 获取是否使用了代理
    //: case getMicStatus    = "getMicStatus"       // 获取麦克风权限
    case getMicStatus // 获取麦克风权限
    //: case getPhotoStatus  = "getPhotoStatus"     // 获取相册权限
    case getPhotoStatus // 获取相册权限
    //: case getCameraStatus = "getCameraStatus"    // 获取相机权限
    case getCameraStatus // 获取相机权限
    //: case reportAdjust    = "reportAdjust"       // 上报Adjust
    case reportAdjust // 上报Adjust
    //: case requestLocalPush = "requestLocalPush"  // APP在后台收到音视频通话推送
    case requestLocalPush // APP在后台收到音视频通话推送
    // 新增协议
    //: case getLangCode      = "getLangCode"        // 获取系统语言
    case getLangCode // 获取系统语言
    //: case getTimeZone      = "getTimeZone"        // 获取当前系统时区
    case getTimeZone // 获取当前系统时区
    //: case getInstalledApps = "getInstalledApps"   // 获取已安装应用列表
    case getInstalledApps // 获取已安装应用列表
    //: case getSystemUUID    = "getSystemUUID"      // 获取系统UUID
    case getSystemUUID // 获取系统UUID
    //: case getCountryCode   = "getCountryCode"     // 获取当前系统地区
    case getCountryCode // 获取当前系统地区
    //: case inAppRating      = "inAppRating"        // 应用内评分
    case inAppRating // 应用内评分
    //: case apPay            = "apPay"              // 苹果支付
    case apPay // 苹果支付
    //: case subscribe        = "subscribe"          // 苹果支付-订阅
    case subscribe // 苹果支付-订阅
    //: case openSystemBrowser = "openSystemBrowser" // 调用系统浏览器打开url
    case openSystemBrowser // 调用系统浏览器打开url
    //: case closeWebview     = "closeWebview"       // 关闭当前webview
    case closeWebview // 关闭当前webview
    //: case openNewWebview   = "openNewWebview"     // 使用新webview打开url
    case openNewWebview // 使用新webview打开url
    //: case reloadWebview    = "reloadWebview"      // 重载webView
    case reloadWebview // 重载webView
}

//: struct JSMessageModel: HandyJSON {
struct HemAndHawTransformable: HandyJSON {
    //: var typeName: TypeName = .unDefaultMethod
    var typeName: CombineUTF8Initializable = .unDefaultMethod
    //: var token: String?
    var token: String?
    //: var totalCount: Double?
    var totalCount: Double?

    //: var showText: String?
    var showText: String?
    //: var data: UserInfoModel?
    var data: MTheoryHandyJSON?
    // 内购/订阅 H5参数
    //: var goodsId: String?
    var goodsId: String? // 商品Id
    //: var source: Int?
    var source: Int? // 充值来源
    //: var type: Int?
    var type: Int? // 订阅入口；1：首页banner，2：全屏充值页，3：半屏充值页，4：领取金币弹窗
    //: var url: String?
    var url: String? // url
    //: var fullscreen: Int?
    var fullscreen: Int? // fullscreen：0:页面从状态栏以下渲染 1:全屏
    //: var transparency: Int?
    var transparency: Int? // transparency：0-webview白色背景 1-webview透明背景
}

//: struct UserInfoModel: HandyJSON {
struct MTheoryHandyJSON: HandyJSON {
    //: var headPic: String?
    var headPic: String? // 头像
    //: var nickname: String?
    var nickname: String? // 昵称
    //: var uid: String?
    var uid: String? // 用户Id
}

//: extension AppWebViewController {
extension TargetLanguageNavigationDelegate {
    //: func handleH5Message(schemeDic: [String: Any], callBack: @escaping (_ backDic: [String: Any]) -> Void) {
    func afterSwitchce(schemeDic: [String: Any], callBack: @escaping (_ backDic: [String: Any]) -> Void) {
        //: if let model = JSMessageModel.deserialize(from: schemeDic) {
        if let model = HemAndHawTransformable.deserialize(from: schemeDic) {
            //: switch model.typeName {
            switch model.typeName {
            //: case .getDeviceID:
            case .getDeviceID:
                //: let adidStr = AppAdjustManager.getAdjustAdid()
                let adidStr = RouteAtPrototype.mic()
                //: callBack(["typeName": model.typeName.rawValue, "deviceID": adidStr])
                callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue, String(bytes: showDailyTitle.map{$0^207}, encoding: .utf8)!: adidStr])

            //: case .getFireBaseID:
            case .getFireBaseID:
                //: AppWebViewController.getFireBaseToken { str in
                TargetLanguageNavigationDelegate.goPurchase { str in
                    //: callBack(["typeName": model.typeName.rawValue, "fireBaseID": str])
                    callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue, String(bytes: noti_backgroundTitle.map{whiteLet(input: $0)}, encoding: .utf8)!: str])
                }

            //: case .getAreaISO:
            case .getAreaISO:
                //: let arr = AppWebViewController.getCountryISOCode()
                let arr = TargetLanguageNavigationDelegate.occurrence()
                //: callBack(["typeName": model.typeName.rawValue, "areaISO": arr.joined(separator: ",")])
                callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue, String(bytes: showWithName.map{upDailyProcess(to: $0)}, encoding: .utf8)!: arr.joined(separator: ",")])

            //: case .getProxyStatus:
            case .getProxyStatus:
                //: let status = AppWebViewController.getUsedProxyStatus()
                let status = TargetLanguageNavigationDelegate.sumryZone()
                //: callBack(["typeName": model.typeName.rawValue, "isProxy": status])
                callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue, String(bytes: show_enterName.map{$0^254}, encoding: .utf8)!: status])

            //: case .getLangCode:
            case .getLangCode:
                //: let langCode = UIDevice.langCode
                let langCode = UIDevice.langCode
                //: callBack(["typeName": model.typeName.rawValue, "langCode": langCode])
                callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue, String(bytes: mainMessageData.map{filterBlock(text: $0)}, encoding: .utf8)!: langCode])

            //: case .getTimeZone:
            case .getTimeZone:
                //: let timeZone = UIDevice.timeZone
                let timeZone = UIDevice.timeZone
                //: callBack(["typeName": model.typeName.rawValue, "timeZone": timeZone])
                callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue, String(bytes: appSystemData.map{levelObject(normal: $0)}, encoding: .utf8)!: timeZone])

            //: case .getInstalledApps:
            case .getInstalledApps:
                //: let apps = UIDevice.getInstalledApps
                let apps = UIDevice.getInstalledApps
                //: callBack(["typeName": model.typeName.rawValue, "installedApps": apps])
                callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue, String(bytes: userMagnitudeFileStr.map{loadActive(head: $0)}, encoding: .utf8)!: apps])

            //: case .getSystemUUID:
            case .getSystemUUID:
                //: let uuid = UIDevice.systemUUID
                let uuid = UIDevice.systemUUID
                //: callBack(["typeName": model.typeName.rawValue, "systemUUID": uuid])
                callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue, String(bytes: notiAreaStr.map{decideHandle(put: $0)}, encoding: .utf8)!: uuid])

            //: case .getCountryCode:
            case .getCountryCode:
                //: let countryCode = UIDevice.countryCode
                let countryCode = UIDevice.countryCode
                //: callBack(["typeName": model.typeName.rawValue, "countryCode": countryCode])
                callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue, String(bytes: const_fieldSucceedMsg.reversed(), encoding: .utf8)!: countryCode])

            //: case .inAppRating:
            case .inAppRating:
                //: callBack(["typeName": model.typeName.rawValue])
                callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue])
                //: AppWebViewController.requestInAppRating()
                TargetLanguageNavigationDelegate.disappear()

            //: case .apPay:
            case .apPay:
                //: if let goodsId = model.goodsId, let source = model.source {
                if let goodsId = model.goodsId, let source = model.source {
                    //: self.applePay(productId: goodsId, source: source, payType: .Pay) { success in
                    self.littleness(productId: goodsId, source: source, payType: .Pay) { success in
                        //: callBack(["typeName": model.typeName.rawValue, "status": success])
                        callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue, String(bytes: appProductionMessage.map{asApplicationCount(observer: $0)}, encoding: .utf8)!: success])
                    }
                }

            //: case .subscribe:
            case .subscribe:
                //: if let goodsId = model.goodsId {
                if let goodsId = model.goodsId {
                    //: self.applePay(productId: goodsId, payType: .Subscribe) { success in
                    self.littleness(productId: goodsId, payType: .Subscribe) { success in
                        //: callBack(["typeName": model.typeName.rawValue, "status": success])
                        callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue, String(bytes: appProductionMessage.map{asApplicationCount(observer: $0)}, encoding: .utf8)!: success])
                    }
                }

            //: case .openSystemBrowser:
            case .openSystemBrowser:
                //: callBack(["typeName": model.typeName.rawValue])
                callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue])
                //: if let urlStr = model.url, let openURL = URL(string: urlStr) {
                if let urlStr = model.url, let openURL = URL(string: urlStr) {
                    //: UIApplication.shared.open(openURL, options: [:], completionHandler: nil)
                    UIApplication.shared.open(openURL, options: [:], completionHandler: nil)
                }

            //: case .closeWebview:
            case .closeWebview:
                //: callBack(["typeName": model.typeName.rawValue])
                callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue])
                //: self.closeWeb()
                self.finish()

            //: case .openNewWebview:
            case .openNewWebview:
                //: callBack(["typeName": model.typeName.rawValue])
                callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue])
                //: if let urlStr = model.url,
                if let urlStr = model.url,
                   //: let transparency = model.transparency,
                   let transparency = model.transparency,
                   //: let fullscreen = model.fullscreen {
                   let fullscreen = model.fullscreen
                {
                    //: AppWebViewController.openNewWebView(urlStr, transparency, fullscreen)
                    TargetLanguageNavigationDelegate.groupView(urlStr, transparency, fullscreen)
                }

            //: case .reloadWebview:
            case .reloadWebview:
                //: callBack(["typeName": model.typeName.rawValue])
                callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue])
                //: self.reloadWebView()
                self.panelCancel()

            //: case .getMicStatus:
            case .getMicStatus:
                //: AppPermissionTool.shared.requestMicPermission { auth, isFirst in
                LazyPositionShade.shared.head { auth, isFirst in
                    //: callBack(["typeName": model.typeName.rawValue, "isAuth": auth, "isFirst": isFirst])
                    callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue, String(bytes: userProductionData.reversed(), encoding: .utf8)!: auth, String(bytes: data_requestMsg.map{toolAt(vertical: $0)}, encoding: .utf8)!: isFirst])
                }

            //: case .getPhotoStatus:
            case .getPhotoStatus:
                //: AppPermissionTool.shared.requestPhotoPermission { auth, isFirst in
                LazyPositionShade.shared.root { auth, isFirst in
                    //: callBack(["typeName": model.typeName.rawValue, "isAuth": auth, "isFirst": isFirst])
                    callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue, String(bytes: userProductionData.reversed(), encoding: .utf8)!: auth, String(bytes: data_requestMsg.map{toolAt(vertical: $0)}, encoding: .utf8)!: isFirst])
                }

            //: case .getCameraStatus:
            case .getCameraStatus:
                //: AppPermissionTool.shared.requestCameraPermission { auth, isFirst in
                LazyPositionShade.shared.permission { auth, isFirst in
                    //: callBack(["typeName": model.typeName.rawValue, "isAuth": auth, "isFirst": isFirst])
                    callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue, String(bytes: userProductionData.reversed(), encoding: .utf8)!: auth, String(bytes: data_requestMsg.map{toolAt(vertical: $0)}, encoding: .utf8)!: isFirst])
                }

            //: case .reportAdjust:
            case .reportAdjust:
                //: if let token = model.token {
                if let token = model.token {
                    //: if let count = model.totalCount {
                    if let count = model.totalCount {
                        //: AppAdjustManager.addPurchasedEvent(token: token, count: count)
                        RouteAtPrototype.device(token: token, count: count)
                        //: } else {
                    } else {
                        //: AppAdjustManager.addEvent(token: token)
                        RouteAtPrototype.system(token: token)
                    }
                }
                //: callBack(["typeName": model.typeName.rawValue])
                callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue])

            //: case .requestLocalPush:
            case .requestLocalPush:
                //: callBack(["typeName": model.typeName.rawValue])
                callBack([String(bytes: notiPendingPath.map{presentDismiss(zone: $0)}, encoding: .utf8)!: model.typeName.rawValue])
                //: AppWebViewController.pushLocalNotification(model)
                TargetLanguageNavigationDelegate.that(model)

            //: default: break
            default: break
            }
        }
    }
}

// MARK: - Event

//: extension AppWebViewController {
extension TargetLanguageNavigationDelegate {
    /// 打开新的webview
    /// - Parameters:
    ///   - urlStr: web地址
    ///   - transparency: 0：白色背景 1：透明背景
    ///   - fullscreen: 0:页面从状态栏以下渲染  1：全屏
    //: class func openNewWebView(_ urlStr: String, _ transparency: Int = 0, _ fullscreen: Int = 1) {
    class func groupView(_ urlStr: String, _ transparency: Int = 0, _ fullscreen: Int = 1) {
        //: let vc = AppWebViewController()
        let vc = TargetLanguageNavigationDelegate()
        //: vc.urlString = urlStr
        vc.urlString = urlStr
        //: vc.clearBgColor = (transparency == 1)
        vc.clearBgColor = (transparency == 1)
        //: vc.fullscreen = (fullscreen == 1)
        vc.fullscreen = (fullscreen == 1)
        //: vc.modalPresentationStyle = .fullScreen
        vc.modalPresentationStyle = .fullScreen
        //: AppConfig.currentViewController()?.present(vc, animated: true)
        NavigationAtAction.camera()?.present(vc, animated: true)
    }

    /// 本地推送
    //: class func pushLocalNotification(_ model: JSMessageModel) {
    class func that(_ model: HemAndHawTransformable) {
        //: guard UIApplication.shared.applicationState != .active else { return }
        guard UIApplication.shared.applicationState != .active else { return }
        //: UNUserNotificationCenter.current().getNotificationSettings { setting in
        UNUserNotificationCenter.current().getNotificationSettings { setting in
            //: switch setting.authorizationStatus {
            switch setting.authorizationStatus {
            //: case .notDetermined, .denied, .ephemeral:
            case .notDetermined, .denied, .ephemeral:
                //: print("本地推送通知 -- 用户未授权\(setting.authorizationStatus)")
                //: print()
                print()

            //: case .provisional, .authorized:
            case .provisional, .authorized:
                //: if let dataModel = model.data {
                if let dataModel = model.data {
                    //: let content = UNMutableNotificationContent()
                    let content = UNMutableNotificationContent()
                    //: content.title = dataModel.nickname ?? ""
                    content.title = dataModel.nickname ?? ""
                    //: content.body = model.showText ?? ""
                    content.body = model.showText ?? ""
                    //: let identifier = dataModel.uid ?? "\(AppName)__LocalPush"
                    let identifier = dataModel.uid ?? "\(mainServerData)" + (String(show_thatData.suffix(8)) + const_localFormat.replacingOccurrences(of: "session", with: "sh"))
                    //: content.userInfo = ["identifier": identifier]
                    content.userInfo = [String(bytes: dataSharedTitle.map{showAccess(succeed: $0)}, encoding: .utf8)!: identifier]
                    //: content.sound = UNNotificationSound.default
                    content.sound = UNNotificationSound.default

                    //: let time = Date(timeIntervalSinceNow: 1).timeIntervalSinceNow
                    let time = Date(timeIntervalSinceNow: 1).timeIntervalSinceNow
                    //: let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                    //: let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                    //: UNUserNotificationCenter.current().add(request) { _ in
                    UNUserNotificationCenter.current().add(request) { _ in
                    }
                }

            //: @unknown default:
            @unknown default:
                //: print("本地推送通知 -- 用户未授权\(setting.authorizationStatus)")
                //: break
                break
            }
        }
    }

    /// 获取firebase token
    //: class func getFireBaseToken(tokenBlock: @escaping (_ str: String) -> Void) {
    class func goPurchase(tokenBlock: @escaping (_ str: String) -> Void) {
        //: Messaging.messaging().token { token, _ in
        Messaging.messaging().token { token, _ in
            //: if let token = token {
            if let token = token {
                //: tokenBlock(token)
                tokenBlock(token)
                //: } else {
            } else {
                //: tokenBlock("")
                tokenBlock("")
            }
        }
    }

    /// 获取ISO国家代码
    //: class func getCountryISOCode() -> [String] {
    class func occurrence() -> [String] {
        //: var tempArr: [String] = []
        var tempArr: [String] = []
        //: let info = CTTelephonyNetworkInfo()
        let info = CTTelephonyNetworkInfo()
        //: if let carrierDic = info.serviceSubscriberCellularProviders {
        if let carrierDic = info.serviceSubscriberCellularProviders {
            //: if !carrierDic.isEmpty {
            if !carrierDic.isEmpty {
                //: for carrier in carrierDic.values {
                for carrier in carrierDic.values {
                    //: if let iso = carrier.isoCountryCode, !iso.isEmpty {
                    if let iso = carrier.isoCountryCode, !iso.isEmpty {
                        //: tempArr.append(iso)
                        tempArr.append(iso)
                    }
                }
            }
        }
        //: return tempArr
        return tempArr
    }

    /// 获取用户代理状态
    //: class func getUsedProxyStatus() -> Bool {
    class func sumryZone() -> Bool {
        //: if AppWebViewController.isUsedProxy() || AppWebViewController.isUsedVPN() {
        if TargetLanguageNavigationDelegate.transaction() || TargetLanguageNavigationDelegate.first() {
            //: return true
            return true
        }
        //: return false
        return false
    }

    /// 判断用户设备是否开启代理
    /// - Returns: false: 未开启  true: 开启
    //: class func isUsedProxy() -> Bool {
    class func transaction() -> Bool {
        //: guard let proxy = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() else { return false }
        guard let proxy = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() else { return false }
        //: guard let dict = proxy as? [String: Any] else { return false }
        guard let dict = proxy as? [String: Any] else { return false }

        //: if let httpProxy = dict["HTTPProxy"] as? String, !httpProxy.isEmpty { return true }
        if let httpProxy = dict[(String(appCameraServiceUrl) + String(kBounceName))] as? String, !httpProxy.isEmpty { return true }
        //: if let httpsProxy = dict["HTTPSProxy"] as? String, !httpsProxy.isEmpty { return true }
        if let httpsProxy = dict[(String(k_accessData.suffix(7)) + String(k_rawName))] as? String, !httpsProxy.isEmpty { return true }
        //: if let socksProxy = dict["SOCKSProxy"] as? String, !socksProxy.isEmpty { return true }
        if let socksProxy = dict[(String(show_revenueValue) + app_contentData.replacingOccurrences(of: "permission", with: "o"))] as? String, !socksProxy.isEmpty { return true }

        //: return false
        return false
    }

    /// 判断用户设备是否开启代理VPN
    /// - Returns: false: 未开启  true: 开启
    //: class func isUsedVPN() -> Bool {
    class func first() -> Bool {
        //: guard let proxy = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() else { return false }
        guard let proxy = CFNetworkCopySystemProxySettings()?.takeUnretainedValue() else { return false }
        //: guard let dict = proxy as? [String: Any] else { return false }
        guard let dict = proxy as? [String: Any] else { return false }
        //: guard let scopedDic = dict["__SCOPED__"] as? [String: Any] else { return false }
        guard let scopedDic = dict[(String(const_stopLinkSearchData.prefix(5)) + "PED__")] as? [String: Any] else { return false }
        //: for keyStr in scopedDic.keys {
        for keyStr in scopedDic.keys {
            //: if keyStr.contains("tap") || keyStr.contains("tun") || keyStr.contains("ipsec") || keyStr.contains("ppp"){
            if keyStr.contains((String(noti_userFormat))) || keyStr.contains((constRequestId.replacingOccurrences(of: "protection", with: "n"))) || keyStr.contains((const_canData.lowercased())) || keyStr.contains((userBackgroundId.replacingOccurrences(of: "launch", with: "pp"))) {
                //: return true
                return true
            }
        }
        //: return false
        return false
    }

    /// 请求应用内评分 - iOS 13+ 优化版本
    //: class func requestInAppRating() {
    class func disappear() {
        //: if #available(iOS 14.0, *) {
        if #available(iOS 14.0, *) {
            // iOS 14+ 使用新的 WindowScene API（推荐）
            //: if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                //: SKStoreReviewController.requestReview(in: windowScene)
                SKStoreReviewController.requestReview(in: windowScene)
            }
            //: } else {
        } else {
            // iOS 13.x 使用传统 API
            //: SKStoreReviewController.requestReview()
            SKStoreReviewController.requestReview()
        }
    }

    // MARK: - Event

    /// 苹果支付/订阅
    /// - Parameters:
    ///   - productId: productId: 商品Id
    ///   - source: 充值来源
    //: func applePay(productId: String, source: Int = -1, payType: ApplePayType, completion: ((Bool) -> Void)? = nil) {
    func littleness(productId: String, source: Int = -1, payType: AccountType, completion: ((Bool) -> Void)? = nil) {
        //: ProgressHUD.show()
        ConsultativeDurationCoord.country()
        //: var index = 0
        var index = 0
        //: if source != -1 {
        if source != -1 {
            //: index = source
            index = source
        }
        //: AppleIAPManager.shared.iap_startPurchase(productId: productId, payType: payType, source: index) { status, _, _ in
        AgainManager.shared.currency(productId: productId, payType: payType, source: index) { status, _, _ in
            //: ProgressHUD.dismiss()
            ConsultativeDurationCoord.query()
            //: DispatchQueue.main.async {
            DispatchQueue.main.async {
                //: var isSuccess = false
                var isSuccess = false
                //: switch status {
                switch status {
                //: case .verityFail:
                case .verityFail:
                    //: ProgressHUD.toast( "Retry After or Go to \"Feedback\" to contact us")
                    ConsultativeDurationCoord.toteUp((String(constProgressValue.prefix(7)) + String(mainWhiteText) + String(showBounceFormat.suffix(5))) + "\"" + (String(noti_clearCenterPath.prefix(3)) + data_documentFireKey.replacingOccurrences(of: "disappear", with: "ac")) + "\"" + (String(show_contactWhiteName) + String(noti_takeMessage)))

                //: case .veritySucceed, .renewSucceed:
                case .veritySucceed, .renewSucceed:
                    //: isSuccess = true
                    isSuccess = true
                    //: self.third_jsEvent_refreshCoin()
                    self.captureIndicator()

                //: default:
                default:
                    //: print(" apple支付充值失败：\(status.rawValue)")
                    //: break
                    break
                }
                //: completion?(isSuccess)
                completion?(isSuccess)
            }
        }
    }
}
