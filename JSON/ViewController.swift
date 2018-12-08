//
//  ViewController.swift
//  Parse JSON
//
//
//
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //TODO: Call forecast function and print result
        //TODO: pass location  "37.8267,-122.4233" to forecast function
        WeatherJSON.forecast(withLocation: "37.8267,-122.4233") { (arr) in
            print(arr)
        }
        
    }
}

