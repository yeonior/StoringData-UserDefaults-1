//
//  ViewController.swift
//  UserDefaultsExample
//
//  Created by ruslan on 13.10.2021.
//

import UIKit

struct KeyDefaults {
    static let city = "city"
    static let street = "street"
    static let house = "house"
    static let building = "building"
    static let apartment = "apartment"
}

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard

    @IBOutlet weak var cityTextFIeld: UITextField!
    @IBOutlet weak var streetTextField: UITextField!
    @IBOutlet weak var houseTextField: UITextField!
    @IBOutlet weak var buildingTextField: UITextField!
    @IBOutlet weak var apartmentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        defaults.removeObject(forKey: KeyDefaults.city)
//        defaults.removeObject(forKey: KeyDefaults.street)
//        defaults.removeObject(forKey: KeyDefaults.house)
//        defaults.removeObject(forKey: KeyDefaults.building)
//        defaults.removeObject(forKey: KeyDefaults.apartment)
        cityTextFIeld.text = defaults.string(forKey: KeyDefaults.city)
        streetTextField.text = defaults.string(forKey: KeyDefaults.street)
        houseTextField.text = defaults.string(forKey: KeyDefaults.house)
        buildingTextField.text = defaults.string(forKey: KeyDefaults.building)
        apartmentTextField.text = defaults.string(forKey: KeyDefaults.apartment)
    }

    @IBAction func saveButton(_ sender: Any) {
        
        let city = cityTextFIeld.text!
        let street = streetTextField.text!
        let house = houseTextField.text!
        let apartment = apartmentTextField.text!
        let building = buildingTextField.text!
        
        if !city.isEmpty && !street.isEmpty && !house.isEmpty && !apartment.isEmpty {
            Base.shared.saveAddress(city: city, street: street, house: house, building: building, apartment: apartment)
            navigationController?.popViewController(animated: true)
        }
    }
}

