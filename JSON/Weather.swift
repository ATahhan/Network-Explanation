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
    
    // Note: https://api.darksky.net/forecast/[key]/[latitude],[longitude]
    
    
    static let basePath = "https://api.darksky.net/forecast/a8249d85e521fc873308cb1bdedd1155/"
    
    static func forecast (withLocation location:String, completion: @escaping ([WeatherJSON]) -> Void) {
        
        //TODO: pass URL to URLRequest function
        // TODO: implement URLSession
        // TODO: Create Array of WeatherJSON , this array neme:forecastArray
        //TODO: recive daily data from JSON
        
        
            
        }
        
        //task.resume()
        
}
        
        
        
        
        
        
    

