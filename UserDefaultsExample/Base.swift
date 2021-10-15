//
//  Base.swift
//  UserDefaultsExample
//
//  Created by ruslan on 14.10.2021.
//

import Foundation

class Base {
    
    static let shared = Base()
    let defaults = UserDefaults.standard
    
    struct UserAddress: Codable {
        var city: String
        var street: String
        var house: String
        var building: String?
        var apartment: String
        var description: String {
            return "\(city), \(street), \(house), \(building ?? "no building"), \(apartment)"
        }
    }
    
    var addresses: [UserAddress] {
        
        get {
            if let data = defaults.value(forKey: "addresses") as? Data {
                return try! PropertyListDecoder().decode([UserAddress].self, from: data)
            } else {
                return [UserAddress]()
            }
        }
        
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "addresses")
            }
        }
    }
    
    func saveAddress(city: String, street: String, house: String, building: String?, apartment: String) {
        
        let address = UserAddress(city: city, street: street, house: house, building: building, apartment: apartment)
        addresses.insert(address, at: 0)
    }
}
