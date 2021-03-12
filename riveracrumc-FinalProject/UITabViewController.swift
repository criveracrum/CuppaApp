//
//  UITabViewController.swift
//  riveracrumc-FinalProject
//
//  Created by Chadwick on 3/8/21.
//

import UIKit

enum Brews : String {
    case V60 = "V60"
    case FrenchPress = "French Press"
    case AeroPress = "AeroPress"
    var name : String {return self.rawValue}
}
class UserPreference {
    
    static let sharedInstance = UserPreference();
    
    var brewType : Brews = .V60;
    
    var brewLength : Int = 0;
    
    var userName : String = "";
    
    var suggestions : Bool = true;
    
    var brewSize : Int = 500;
    
    var roastType: Int = 0;
    
    func roastTypeDisplay() -> String{
        switch roastType{
        case -1:
            return "Light";
        case 0:
            return "Medium";
        case 1:
            return "Dark";
        default:
            return "Medium";
        }
    }
    func brewLengthDisplay() -> String{
        switch brewLength{
        case -1:
            return "Short";
        case 0:
            return "Normal";
        case 1:
            return "Long";
        default:
            return "Normal";
        }
    }
    func getSuggestion() -> String {
        return suggestions==true ? "On" : "Off";
    }
    
}


class UITabViewController: UIViewController {

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
