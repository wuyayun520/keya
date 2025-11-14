
//: Declare String Begin

/*: "Net Error, Try again later" :*/
fileprivate let kReportKey:String = "Net Ercolor zone privacy"
fileprivate let user_reduceText:String = " Try bounce new"
fileprivate let user_remotePath:String = "again need service country base"

/*: "data" :*/
fileprivate let showReplaceUrl:[Character] = ["d","a","t","a"]

/*: ":null" :*/
fileprivate let showSessionText:[Character] = [":","n","u","l","l"]

/*: "json error" :*/
fileprivate let app_clickData:String = "pic present pic tooljson e"

/*: "platform=iphone&version= :*/
fileprivate let dataProductionForwardAvailablePath:[Character] = ["p","l","a","t","f","o","r"]
fileprivate let k_mirrorId:[Character] = ["m","=","i","p","h","o","n","e","&","v","e"]
fileprivate let notiUsedData:String = "rsion=hide i reduce white"

/*: &packageId= :*/
fileprivate let noti_methodTitle:[Character] = ["&","p","a","c","k","a","g","e"]
fileprivate let showPermissionPath:String = "observer date album poor modelId="

/*: &bundleId= :*/
fileprivate let appContentId:String = "&bundcolor click link else"

/*: &lang= :*/
fileprivate let kActivityValue:[Character] = ["&","l","a","n","g","="]

/*: ; build: :*/
fileprivate let dataSpaceId:String = "link always key post; build:"

/*: ; iOS  :*/
fileprivate let k_carrierTransformName:String = "; iOS manager vertical agent foundation"

//: Declare String End

//: import Alamofire
import Alamofire
//: import CoreMedia
import CoreMedia
//: import HandyJSON
import HandyJSON
// __DEBUG__
// __CLOSE_PRINT__
//: import UIKit
import UIKit

//: typealias FinishBlock = (_ succeed: Bool, _ result: Any?, _ errorModel: AppErrorResponse?) -> Void
typealias FinishBlock = (_ succeed: Bool, _ result: Any?, _ errorModel: WorkErrorResponse?) -> Void

//: @objc class AppRequestTool: NSObject {
@objc class ProdRequestTool: NSObject {
    /// 发起Post请求
    /// - Parameters:
    ///   - model: 请求参数
    ///   - completion: 回调
    //: class func startPostRequest(model: AppRequestModel, completion: @escaping FinishBlock) {
    class func methodLaunch(model: RequestModel, completion: @escaping FinishBlock) {
        //: let serverUrl = self.buildServerUrl(model: model)
        let serverUrl = self.putUp(model: model)
        //: let headers = self.getRequestHeader(model: model)
        let headers = self.header(model: model)
        //: AF.request(serverUrl, method: .post, parameters: model.params, headers: headers, requestModifier: { $0.timeoutInterval = 10.0 }).responseData { [self] responseData in
        AF.request(serverUrl, method: .post, parameters: model.params, headers: headers, requestModifier: { $0.timeoutInterval = 10.0 }).responseData { [self] responseData in
            //: switch responseData.result {
            switch responseData.result {
            //: case .success:
            case .success:
                //: func__requestSucess(model: model, response: responseData.response!, responseData: responseData.data!, completion: completion)
                cancel(model: model, response: responseData.response!, responseData: responseData.data!, completion: completion)

            //: case .failure:
            case .failure:
                //: completion(false, nil, AppErrorResponse.init(errorCode: RequestResultCode.NetError.rawValue, errorMsg: "Net Error, Try again later"))
                completion(false, nil, WorkErrorResponse(errorCode: ResourceTextConvertible.NetError.rawValue, errorMsg: (String(kReportKey.prefix(6)) + "ror," + String(user_reduceText.prefix(5)) + String(user_remotePath.prefix(6)) + "later")))
            }
        }
    }

    //: class func func__requestSucess(model: AppRequestModel, response: HTTPURLResponse, responseData: Data, completion: @escaping FinishBlock) {
    class func cancel(model _: RequestModel, response _: HTTPURLResponse, responseData: Data, completion: @escaping FinishBlock) {
        //: var responseJson = String(data: responseData, encoding: .utf8)
        var responseJson = String(data: responseData, encoding: .utf8)
        //: responseJson = responseJson?.replacingOccurrences(of: "\"data\":null", with: "\"data\":{}")
        responseJson = responseJson?.replacingOccurrences(of: "\"" + (String(showReplaceUrl)) + "\"" + (String(showSessionText)), with: "" + "\"" + (String(showReplaceUrl)) + "\"" + ":{}")
        //: if let responseModel = JSONDeserializer<AppBaseResponse>.deserializeFrom(json: responseJson) {
        if let responseModel = JSONDeserializer<DependentHandyJSON>.deserializeFrom(json: responseJson) {
            //: if responseModel.errno == RequestResultCode.Normal.rawValue {
            if responseModel.errno == ResourceTextConvertible.Normal.rawValue {
                //: completion(true, responseModel.data, nil)
                completion(true, responseModel.data, nil)
                //: } else {
            } else {
                //: completion(false, responseModel.data, AppErrorResponse.init(errorCode: responseModel.errno, errorMsg: responseModel.msg ?? ""))
                completion(false, responseModel.data, WorkErrorResponse(errorCode: responseModel.errno, errorMsg: responseModel.msg ?? ""))
                //: switch responseModel.errno {
                switch responseModel.errno {
//                case ResourceTextConvertible.NeedReLogin.rawValue:
//                    NotificationCenter.default.post(name: DID_LOGIN_OUT_SUCCESS_NOTIFICATION, object: nil, userInfo: nil)
                //: default:
                default:
                    //: break
                    break
                }
            }
            //: } else {
        } else {
            //: completion(false, nil, AppErrorResponse.init(errorCode: RequestResultCode.NetError.rawValue, errorMsg: "json error"))
            completion(false, nil, WorkErrorResponse(errorCode: ResourceTextConvertible.NetError.rawValue, errorMsg: (String(app_clickData.suffix(6)) + "rror")))
        }
    }

    //: class func buildServerUrl(model: AppRequestModel) -> String {
    class func putUp(model: RequestModel) -> String {
        //: var serverUrl: String = model.requestServer
        var serverUrl: String = model.requestServer
        //: let otherParams = "platform=iphone&version=\(AppNetVersion)&packageId=\(PackageID)&bundleId=\(AppBundle)&lang=\(UIDevice.interfaceLang)"
        let otherParams = (String(dataProductionForwardAvailablePath) + String(k_mirrorId) + String(notiUsedData.prefix(6))) + "\(notiServerDailyUrl)" + (String(noti_methodTitle) + String(showPermissionPath.suffix(3))) + "\(kCollectionValue)" + (String(appContentId.prefix(5)) + "leId=") + "\(show_terminationData)" + (String(kActivityValue)) + "\(UIDevice.interfaceLang)"
        //: if !model.requestPath.isEmpty {
        if !model.requestPath.isEmpty {
            //: serverUrl.append("/\(model.requestPath)")
            serverUrl.append("/\(model.requestPath)")
        }
        //: serverUrl.append("?\(otherParams)")
        serverUrl.append("?\(otherParams)")

        //: return serverUrl
        return serverUrl
    }

    /// 获取请求头参数
    /// - Parameter model: 请求模型
    /// - Returns: 请求头参数
    //: class func getRequestHeader(model: AppRequestModel) -> HTTPHeaders {
    class func header(model _: RequestModel) -> HTTPHeaders {
        //: let userAgent = "\(AppName)/\(AppVersion) (\(AppBundle); build:\(AppBuildNumber); iOS \(UIDevice.current.systemVersion); \(UIDevice.modelName))"
        let userAgent = "\(mainServerData)/\(const_reasonKey) (\(show_terminationData)" + (String(dataSpaceId.suffix(8))) + "\(dataArrowId)" + (String(k_carrierTransformName.prefix(6))) + "\(UIDevice.current.systemVersion); \(UIDevice.modelName))"
        //: let headers = [HTTPHeader.userAgent(userAgent)]
        let headers = [HTTPHeader.userAgent(userAgent)]
        //: return HTTPHeaders(headers)
        return HTTPHeaders(headers)
    }
}
