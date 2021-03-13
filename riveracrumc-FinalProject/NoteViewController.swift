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
    }
    
    @IBAction func satisfied(_ sender: UIButton) {
        
    }
    @IBAction func dissatisfied(_ sender: UIButton) {
        
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
