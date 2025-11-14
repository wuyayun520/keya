
//: Declare String Begin

/*: "peertub" :*/
fileprivate let notiSharedName:[Character] = ["p","e","e","r","t","u","b"]

/*: "https://m. :*/
fileprivate let dataCanPath:[Character] = ["h","t","t","p","s"]
fileprivate let notiThirdId:String = "media click fatal add layer://m."

/*: .com" :*/
fileprivate let user_scaleMessage:[Character] = [".","c","o","m"]

/*: "1.9.1" :*/
fileprivate let const_spaceFromScriptUrl:String = "corner.9.corner"

/*: "993" :*/
fileprivate let showDeadlineFormat:String = "onon3"

/*: "g4plq36qyghs" :*/
fileprivate let mainTargetUrl:[Character] = ["g","4","p","l"]
fileprivate let main_installMessage:String = "q36qygfires"

/*: "murl0y" :*/
fileprivate let user_warnName:String = "MURL0Y"

/*: "CFBundleShortVersionString" :*/
fileprivate let dataLabPendingPath:String = "CFBundm vertical progress field allow"
fileprivate let showAppearPath:String = "system foundation used processortVers"
fileprivate let main_adjustmentName:[Character] = ["i"]
fileprivate let constFireContent:[Character] = ["o","n","S","t","r","i","n","g"]

/*: "CFBundleDisplayName" :*/
fileprivate let const_installText:String = "area not finish privacyCFBun"
fileprivate let show_logMsg:String = "neveray"
fileprivate let constNameValue:String = "present us version in statusName"

/*: "CFBundleVersion" :*/
fileprivate let noti_groupTakeUrl:String = "lab auto full carrier adjustmentCFBund"
fileprivate let notiIndexUrl:String = "where local bar noleVe"
fileprivate let noti_installRootUrl:String = "rshowon"

/*: "weixin" :*/
fileprivate let showMapGoMessage:[Character] = ["w","e","i","x","i","n"]

/*: "wxwork" :*/
fileprivate let constCanStr:String = "wfilework"

/*: "dingtalk" :*/
fileprivate let user_activeShowData:String = "dlanguageg"

/*: "lark" :*/
fileprivate let app_atWithTitle:[Character] = ["l","a","r","k"]

//: Declare String End

// __DEBUG__
// __CLOSE_PRINT__
//
//  NavigationAtAction.swift
//  OverseaH5
//
//  Created by young on 2025/9/24.
//

//: import KeychainSwift
import KeychainSwift
//: import UIKit
import UIKit

/// 域名
//: let ReplaceUrlDomain = "peertub"
let data_targetMsg = (String(notiSharedName))
//: let H5WebDomain = "https://m.\(ReplaceUrlDomain).com"
let data_immediatelyMessage = (String(dataCanPath) + String(notiThirdId.suffix(5))) + "\(data_targetMsg)" + (String(user_scaleMessage))
/// 网络版本号
//: let AppNetVersion = "1.9.1"
let notiServerDailyUrl = (const_spaceFromScriptUrl.replacingOccurrences(of: "corner", with: "1"))
/// 包ID
//: let PackageID = "993"
let kCollectionValue = (showDeadlineFormat.replacingOccurrences(of: "on", with: "9"))
/// Adjust
//: let AdjustKey = "g4plq36qyghs"
let app_revenueStr = (String(mainTargetUrl) + main_installMessage.replacingOccurrences(of: "fire", with: "h"))
//: let AdInstallToken = "murl0y"
let data_transformSFloatStr = (user_warnName.lowercased())

//: let AppVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
let const_reasonKey = Bundle.main.infoDictionary![(String(dataLabPendingPath.prefix(6)) + "leSh" + String(showAppearPath.suffix(7)) + String(main_adjustmentName) + String(constFireContent))] as! String
//: let AppBundle = Bundle.main.bundleIdentifier!
let show_terminationData = Bundle.main.bundleIdentifier!
//: let AppName = Bundle.main.infoDictionary!["CFBundleDisplayName"] ?? ""
let mainServerData = Bundle.main.infoDictionary![(String(const_installText.suffix(5)) + "dleDis" + show_logMsg.replacingOccurrences(of: "never", with: "pl") + String(constNameValue.suffix(4)))] ?? ""
//: let AppBuildNumber = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
let dataArrowId = Bundle.main.infoDictionary![(String(noti_groupTakeUrl.suffix(6)) + String(notiIndexUrl.suffix(4)) + noti_installRootUrl.replacingOccurrences(of: "show", with: "si"))] as! String

//: class AppConfig: NSObject {
class NavigationAtAction: NSObject {
    /// 获取状态栏高度
    //: class func getStatusBarHeight() -> CGFloat {
    class func source() -> CGFloat {
        //: if #available(iOS 13.0, *) {
        if #available(iOS 13.0, *) {
            //: if let statusBarManager = UIApplication.shared.windows.first?
            if let statusBarManager = UIApplication.shared.windows.first?
                //: .windowScene?.statusBarManager
                .windowScene?.statusBarManager
            {
                //: return statusBarManager.statusBarFrame.size.height
                return statusBarManager.statusBarFrame.size.height
            }
            //: } else {
        } else {
            //: return UIApplication.shared.statusBarFrame.size.height
            return UIApplication.shared.statusBarFrame.size.height
        }
        //: return 20.0
        return 20.0
    }

    /// 获取window
    //: class func getWindow() -> UIWindow {
    class func makeApp() -> UIWindow {
        //: var window = UIApplication.shared.windows.first(where: {
        var window = UIApplication.shared.windows.first(where: {
            //: $0.isKeyWindow
            $0.isKeyWindow
            //: })
        })
        // 是否为当前显示的window
        //: if window?.windowLevel != UIWindow.Level.normal {
        if window?.windowLevel != UIWindow.Level.normal {
            //: let windows = UIApplication.shared.windows
            let windows = UIApplication.shared.windows
            //: for windowTemp in windows {
            for windowTemp in windows {
                //: if windowTemp.windowLevel == UIWindow.Level.normal {
                if windowTemp.windowLevel == UIWindow.Level.normal {
                    //: window = windowTemp
                    window = windowTemp
                    //: break
                    break
                }
            }
        }
        //: return window!
        return window!
    }

    /// 获取当前控制器
    //: class func currentViewController() -> (UIViewController?) {
    class func camera() -> (UIViewController?) {
        //: var window = AppConfig.getWindow()
        var window = NavigationAtAction.makeApp()
        //: if window.windowLevel != UIWindow.Level.normal {
        if window.windowLevel != UIWindow.Level.normal {
            //: let windows = UIApplication.shared.windows
            let windows = UIApplication.shared.windows
            //: for windowTemp in windows {
            for windowTemp in windows {
                //: if windowTemp.windowLevel == UIWindow.Level.normal {
                if windowTemp.windowLevel == UIWindow.Level.normal {
                    //: window = windowTemp
                    window = windowTemp
                    //: break
                    break
                }
            }
        }
        //: let vc = window.rootViewController
        let vc = window.rootViewController
        //: return currentViewController(vc)
        return hand(vc)
    }

    //: class func currentViewController(_ vc: UIViewController?)
    class func hand(_ vc: UIViewController?)
        //: -> UIViewController?
        -> UIViewController?
    {
        //: if vc == nil {
        if vc == nil {
            //: return nil
            return nil
        }
        //: if let presentVC = vc?.presentedViewController {
        if let presentVC = vc?.presentedViewController {
            //: return currentViewController(presentVC)
            return hand(presentVC)
            //: } else if let tabVC = vc as? UITabBarController {
        } else if let tabVC = vc as? UITabBarController {
            //: if let selectVC = tabVC.selectedViewController {
            if let selectVC = tabVC.selectedViewController {
                //: return currentViewController(selectVC)
                return hand(selectVC)
            }
            //: return nil
            return nil
            //: } else if let naiVC = vc as? UINavigationController {
        } else if let naiVC = vc as? UINavigationController {
            //: return currentViewController(naiVC.visibleViewController)
            return hand(naiVC.visibleViewController)
            //: } else {
        } else {
            //: return vc
            return vc
        }
    }
}

// MARK: - Device

//: extension UIDevice {
extension UIDevice {
    //: static var modelName: String {
    static var modelName: String {
        //: var systemInfo = utsname()
        var systemInfo = utsname()
        //: uname(&systemInfo)
        uname(&systemInfo)
        //: let machineMirror = Mirror(reflecting: systemInfo.machine)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        //: let identifier = machineMirror.children.reduce("") {
        let identifier = machineMirror.children.reduce("") {
            //: identifier, element in
            identifier, element in
            //: guard let value = element.value as? Int8, value != 0 else {
            guard let value = element.value as? Int8, value != 0 else {
                //: return identifier
                return identifier
            }
            //: return identifier + String(UnicodeScalar(UInt8(value)))
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        //: return identifier
        return identifier
    }

    /// 获取当前系统时区
    //: static var timeZone: String {
    static var timeZone: String {
        //: let currentTimeZone = NSTimeZone.system
        let currentTimeZone = NSTimeZone.system
        //: return currentTimeZone.identifier
        return currentTimeZone.identifier
    }

    /// 获取当前系统语言
    //: static var langCode: String {
    static var langCode: String {
        //: let language = Locale.preferredLanguages.first
        let language = Locale.preferredLanguages.first
        //: return language ?? ""
        return language ?? ""
    }

    /// 获取接口语言
    //: static var interfaceLang: String {
    static var interfaceLang: String {
        //: let lang = UIDevice.getSystemLangCode()
        let lang = UIDevice.recordBy()
        //: if ["en", "ar", "es", "pt"].contains(lang) {
        if ["en", "ar", "es", "pt"].contains(lang) {
            //: return lang
            return lang
        }
        //: return "en"
        return "en"
    }

    /// 获取当前系统地区
    //: static var countryCode: String {
    static var countryCode: String {
        //: let locale = Locale.current
        let locale = Locale.current
        //: let countryCode = locale.regionCode
        let countryCode = locale.regionCode
        //: return countryCode ?? ""
        return countryCode ?? ""
    }

    /// 获取系统UUID（每次调用都会产生新值，所以需要keychain）
    //: static var systemUUID: String {
    static var systemUUID: String {
        //: let key = KeychainSwift()
        let key = KeychainSwift()
        //: if let value = key.get(AdjustKey) {
        if let value = key.get(app_revenueStr) {
            //: return value
            return value
            //: } else {
        } else {
            //: let value = NSUUID().uuidString
            let value = NSUUID().uuidString
            //: key.set(value, forKey: AdjustKey)
            key.set(value, forKey: app_revenueStr)
            //: return value
            return value
        }
    }

    /// 获取已安装应用信息
    //: static var getInstalledApps: String {
    static var getInstalledApps: String {
        //: var appsArr: [String] = []
        var appsArr: [String] = []
        //: if UIDevice.canOpenApp("weixin") {
        if UIDevice.firstReceive((String(showMapGoMessage))) {
            //: appsArr.append("weixin")
            appsArr.append((String(showMapGoMessage)))
        }
        //: if UIDevice.canOpenApp("wxwork") {
        if UIDevice.firstReceive((constCanStr.replacingOccurrences(of: "file", with: "x"))) {
            //: appsArr.append("wxwork")
            appsArr.append((constCanStr.replacingOccurrences(of: "file", with: "x")))
        }
        //: if UIDevice.canOpenApp("dingtalk") {
        if UIDevice.firstReceive((user_activeShowData.replacingOccurrences(of: "language", with: "in") + "talk")) {
            //: appsArr.append("dingtalk")
            appsArr.append((user_activeShowData.replacingOccurrences(of: "language", with: "in") + "talk"))
        }
        //: if UIDevice.canOpenApp("lark") {
        if UIDevice.firstReceive((String(app_atWithTitle))) {
            //: appsArr.append("lark")
            appsArr.append((String(app_atWithTitle)))
        }
        //: if appsArr.count > 0 {
        if appsArr.count > 0 {
            //: return appsArr.joined(separator: ",")
            return appsArr.joined(separator: ",")
        }
        //: return ""
        return ""
    }

    /// 判断是否安装app
    //: static func canOpenApp(_ scheme: String) -> Bool {
    static func firstReceive(_ scheme: String) -> Bool {
        //: let url = URL(string: "\(scheme)://")!
        let url = URL(string: "\(scheme)://")!
        //: if UIApplication.shared.canOpenURL(url) {
        if UIApplication.shared.canOpenURL(url) {
            //: return true
            return true
        }
        //: return false
        return false
    }

    /// 获取系统语言
    /// - Returns: 国际通用语言Code
    //: @objc public class func getSystemLangCode() -> String {
    @objc public class func recordBy() -> String {
        //: let language = NSLocale.preferredLanguages.first
        let language = NSLocale.preferredLanguages.first
        //: let array = language?.components(separatedBy: "-")
        let array = language?.components(separatedBy: "-")
        //: return array?.first ?? "en"
        return array?.first ?? "en"
    }
}
