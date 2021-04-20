import UIKit

enum currencyCode: String, Decodable {
    case euro
    case usd
    case rub
    case aed
    case unknown
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let type = try container.decode(String.self)
        self = currencyCode(rawValue: type) ?? .unknown
    }
    
}
//let jsonDict = currency.map { $0.toJSONDict }
//let jsonData = try! JSONSerialization.data(withJSONObject: jsonDict, options: [])
//let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
//
//
//print(jsonString!)
