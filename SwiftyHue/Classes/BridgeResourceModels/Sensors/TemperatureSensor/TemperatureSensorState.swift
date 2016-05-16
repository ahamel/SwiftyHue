//
//  TemperatureSensorState.swift
//  Pods
//
//  Created by Jerome Schmitz on 01.05.16.
//
//

import Foundation
import Gloss

public class TemperatureSensorState: SensorState {

    public let temperature: Int
    
    required public init?(json: JSON) {
        
        guard let temperature: Int = "temperature" <~~ json
            
            else { return nil }
        
        self.temperature = temperature
        
        super.init(json: json)
    }
    
    public override func toJSON() -> JSON? {
        
        if var superJson = super.toJSON() {
            var json = jsonify([
                "temperature" ~~> self.temperature
                ])
            superJson.unionInPlace(json!)
            return superJson
        }
        
        return nil
    }
}
