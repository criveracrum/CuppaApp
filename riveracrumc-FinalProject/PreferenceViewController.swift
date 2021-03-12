//
//  PreferenceViewController.swift
//  riveracrumc-FinalProject
//
//  Created by Chadwick on 3/10/21.
//

import UIKit





class PreferenceViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let picker : [Brews] = [Brews.V60, Brews.AeroPress, Brews.FrenchPress];
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker[row].name;
    }
    
    
    @IBOutlet weak var sizeField: UITextField!
    
    @IBOutlet weak var roastType: UISegmentedControl!
    
    @IBOutlet weak var brewPicker: UIPickerView!
    
    @IBOutlet weak var brewTime: UISegmentedControl!
    
    @IBOutlet weak var suggestionsFlag: UISwitch!
    
    @IBOutlet weak var userNameField: UITextField!
    
    var localBrewType : Brews = .V60;
    
    var localBrewLength : Int = 0;
    
    var localUserName : String = "";
    
    
    
    var localBrewSize : Int = 500;
    
    var localRoastType: Int = 0;
    
    @IBAction func savePref(_ sender: UIButton) {
        localBrewType = picker[brewPicker.selectedRow(inComponent: 0)]
        UserPreference.sharedInstance.brewType = localBrewType;
        UserPreference.sharedInstance.brewLength = localBrewLength;
        UserPreference.sharedInstance.userName = localUserName;
        UserPreference.sharedInstance.suggestions = suggestionsFlag.isOn;
        UserPreference.sharedInstance.brewSize = localBrewSize;
        UserPreference.sharedInstance.roastType = localRoastType;
        let title =  "\(UserPreference.sharedInstance.userName)'s Profile :";
        let message = """
        Brew Type: \(UserPreference.sharedInstance.brewType.name)
        Brew Length: \(UserPreference.sharedInstance.brewLengthDisplay())
        Brew Size: \(UserPreference.sharedInstance.brewSize)
        Roast Type: \(UserPreference.sharedInstance.roastTypeDisplay())
        Suggestions: \(UserPreference.sharedInstance.getSuggestion())
        """;
        let alertController = UIAlertController(title: title,
                                                message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Confirm", style: .default, handler: nil);
        alertController.addAction(okayAction);
        present(alertController, animated: true, completion: nil);
        
    }
    @IBAction func sizeSelection(_ sender: UITextField) {
        sender.resignFirstResponder();
        if let size = sender.text{
            if ((Int(size)!) > 0 && (Int(size)!) < 1000){
                localBrewSize = Int(size)!;
            }
            else {
                let alertController = UIAlertController(title: "Error",
                                                        message: "Please enter size between 1-999", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .default, handler: nil);
                alertController.addAction(okayAction);
                present(alertController, animated: true, completion: nil);
            }
        }
    }
    
    @IBAction func userNameSelec(_ sender: UITextField) {
        sender.resignFirstResponder();
        if let user = sender.text{
            if ( user.count > 0 &&   user.count < 10){
                localUserName = user;
                
            }
            else {
                let alertController = UIAlertController(title: "Error",
                                                        message: "Please enter name between 1-9 characters", preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .default, handler: nil);
                alertController.addAction(okayAction);
                present(alertController, animated: true, completion: nil);
            }
                
        }
    }
    
    @IBAction func roastChanged(_ sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex;
        //var type : String;
        switch index {
        case 0 :
            localRoastType = -1;
            
        case 1 :
            localRoastType = 0;
            
        case 2 :
            localRoastType = 1;
        
        default : localRoastType = 0;
        }
        
    }
    
    
    @IBAction func brewTimeChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex;
        //var length : String;
        switch index {
        case 0 :
            localBrewLength = -1;
            
        case 1 :
            localBrewLength = 0;
            
        case 2 :
            localBrewLength = 1;
        
        default : localBrewLength = 0;
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
