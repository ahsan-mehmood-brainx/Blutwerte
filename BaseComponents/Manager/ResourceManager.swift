//
//  ResourceManager.swift
//  Give Savvy
//
//  Created by Hunain Shahid on 06/02/2018.
//  Copyright © 2018 Brainx Technologies. All rights reserved.
//

import Foundation
import ObjectMapper

class ResourceManager {
    public static let shared = ResourceManager()
    private init () { }
    
    func loadStatesFromJson() -> [State]? {
        guard let path = Bundle.main.url(forResource: "States", withExtension: "json") else {
            return nil
        }
        
        do {
            let jsonData = try Data(contentsOf: path, options: .mappedIfSafe)
            let json = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
            
            guard let array = json as? NSArray else {
                return nil
            }
            
            var states = [State]()
            for subJson in array {
                guard let subJson = subJson as? [String: String], let name = subJson["name"], let abbreviation = subJson["abbreviation"] else {
                    continue
                }
                states.append(State(name, abbreviation))
            }
            return states
        } catch {
            return nil
        }
    }
    
    func loadFiltersFromJson() -> [FilterItem]? {
        guard let path = Bundle.main.url(forResource: "Filters", withExtension: "json") else {
            return nil
        }
        
        let states = loadStatesFromJson()
        do {
            let jsonData = try Data(contentsOf: path, options: .mappedIfSafe)
            let json = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
            
            guard let array = json as? NSArray else {
                return nil
            }
            
            var filters = [FilterItem]()
            for subJson in array {
                if let filterItem = Mapper<FilterItem>().map(JSONObject: subJson) {
                    if filterItem.name != nil && filterItem.name! == "State" {
                        filterItem.values = states?.map { $0.name ?? "" }
                    }
                    filters.append(filterItem)
                }
            }
            return filters
        } catch {
            return nil
        }
    }
}
