//
//  Weather.swift
//  Parse JSON
//
//
//
//

import Foundation

struct WeatherJSON {
    let summary:String
    let icon:String
    let temperature:Double
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    
    init(json:[String:Any]) throws {
        guard let summary = json["summary"] as? String else {throw SerializationError.missing("summary is missing")}
        guard let icon = json["icon"] as? String else {throw SerializationError.missing("icon is missing")}
        guard let temperature = json["temperatureMax"] as? Double else {throw SerializationError.missing("temp is missing")}
        
        self.summary = summary
        self.icon = icon
        self.temperature = temperature
    }
    
    // Note: https:// api.darksky.net/forecast/[key]/[latitude],[longitude]
    static let basePath = "https://api.darksky.net/forecast/26f37331057da0a36e0b0915c340214b/"
    
    static func forecast (withLocation location:String, completion: @escaping ([WeatherJSON]) -> Void) {
        
        
        let url = basePath + location
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, err) in
            
            var forecasts: [WeatherJSON] = []
            if let data = data {
                if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let dailyJsonObject = jsonObject!["daily"] as? [String: Any] {
                        if let dataArray = dailyJsonObject["data"] as? [[String:Any]] {
                            for data in dataArray {
                                forecasts.append(try! WeatherJSON(json: data))
                            }
                        }
                    }
                }
            }
            
            completion(forecasts)
        }
        task.resume()
        
    }
    
    
    
}








