//
//  PreferenceViewController.swift
//  riveracrumc-FinalProject
//
//  Created by Chadwick on 3/10/21.
//

import UIKit

class PreferenceViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let picker = ["V60", "AeroPress", "French Press"];
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picker[row];
    }
    
    
    @IBOutlet weak var sizeField: UITextField!
    
    @IBOutlet weak var roastType: UISegmentedControl!
    
    @IBOutlet weak var brewPicker: UIPickerView!
    
    @IBOutlet weak var brewTime: UISegmentedControl!
    
    @IBOutlet weak var suggestionsFlag: UISwitch!
    
    @IBOutlet weak var userNameField: UITextField!
    
    @IBAction func sizeSelection(_ sender: UITextField) {
        sender.resignFirstResponder();
        if let size = sender.text{
            if ((Int(size)!) > 0 && (Int(size)!) < 1000){
                print(size);
            }
        }
    }
    
    @IBAction func userNameSelec(_ sender: UITextField) {
        sender.resignFirstResponder();
        if let user = sender.text{
            if ( user.count > 0 &&   user.count < 10){
                print(user);
            }
                
        }
    }
    
    @IBAction func roastChanged(_ sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex;
        var type : String;
        switch index {
        case 0 :
            type = "light";
            
        case 1 :
            type = "medium";
            
        case 2 :
            type = "dark";
        
        default : type = "medium";
        }
        print(type);
    }
    
    
    @IBAction func brewTimeChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex;
        var length : String;
        switch index {
        case 0 :
            length = "short";
            
        case 1 :
            length = "normal";
            
        case 2 :
            length = "long";
        
        default : length = "normal";
        }
        print(length);
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
