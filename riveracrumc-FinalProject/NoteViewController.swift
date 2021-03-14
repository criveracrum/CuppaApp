//
//  NoteViewController.swift
//  riveracrumc-FinalProject
//
//  Created by Chadwick on 3/13/21.
//

import UIKit

class NoteViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    func setup(){
        if let note = curNote {
            
            dateLabel.text = note.Date
            methodLabel.text = note.Method.name
            sizeLabel.text = String(note.Size)
            lengthLabel.text = String(note.Length)
            roastLabel.text = note.roast
            
        }
       
    }
    
    @IBOutlet weak var dateLabel: UILabel!
    var curNote : Note?;
    @IBOutlet weak var methodLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var roastLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    
    @IBAction func textField(_ sender: UITextField) {
        if let text = sender.text{
            curNote?.userNotes = text;
            
        }
    }
    
    @IBAction func satisfied(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Satified!",
                                                message: "We are glad you are satisfied. Happy brewing!", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Thanks!", style: .default, handler: nil);
        alertController.addAction(okayAction);
        present(alertController, animated: true, completion: nil);
    }
    @IBAction func dissatisfied(_ sender: UIButton) {
        let suggestions = ["a different grind size", "changing your brew length", "a courser grind"];
        let num = Int.random(in: 0...(suggestions.count-1));
        if (UserPreference.sharedInstance.suggestions == true){
            let alertController = UIAlertController(title: "Dissatisfied!",
                                                    message: "We are sorry that you are dissatisfied. Maybe you can try \(suggestions[num]).", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Thanks!", style: .default, handler: nil);
            alertController.addAction(okayAction);
            present(alertController, animated: true, completion: nil);
        }
        else {
            let alertController = UIAlertController(title: "Dissatisfied!",
                                                    message: "You currently have suggestions turned off. We are sorry we can't help.", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .default, handler: nil);
            alertController.addAction(okayAction);
            present(alertController, animated: true, completion: nil);
        }
        
        
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
