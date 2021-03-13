//
//  TimerViewController.swift
//  riveracrumc-FinalProject
//
//  Created by Chadwick on 3/13/21.
//

import UIKit

class TimerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup();
        // Do any additional setup after loading the view.
    }
    func viewWillDisappear() {
        timer.invalidate();
    }
    
    var timer = Timer();
    var seconds = 0;
    var isTimerRunning = false;
    var length = 60;
    var method = Brews.V60
    var steps : [String] = []
    //var stepAmount = 0;
    var stepTracker = 0;
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var methodLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var beanLabel: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func setup(){
        methodLabel.text = UserPreference.sharedInstance.brewType.name
        method = UserPreference.sharedInstance.brewType;
        length = UserPreference.sharedInstance.times[method]!;
        length = UserPreference.sharedInstance.adjustBrewLength(time: length)
        length = UserPreference.sharedInstance.adjustRoastTT(time: length)
        totalLabel.text = formatTimer(time: length);
        beanLabel.text = "\(UserPreference.sharedInstance.brewSize/16) g";
        if let unwrap = UserPreference.sharedInstance.steps[method] {
            steps = unwrap;
        }
        //stepAmount = steps.count;
    }
    @IBAction func runTimer(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateLabel)), userInfo: nil, repeats: true)
        isTimerRunning = true;
        stepLabel.text = steps[stepTracker];
        
    }
    @IBAction func stopTimer(_ sender: UIButton) {
        timer.invalidate();
        isTimerRunning = false;
        timeLabel.text = "00:00";
        seconds = 0;
        stepTracker = 0;
        stepLabel.text = "Not Started"
        
    }
    @objc func updateLabel(){
        if (seconds >= length){
            stepLabel.text = "Enjoy!";
            timer.invalidate();
            let date = Date();
            let timestamp = DateFormatter.localizedString(from: date, dateStyle: DateFormatter.Style.short, timeStyle: DateFormatter.Style.short)
            
            let newNote : Note = Note(Date: timestamp, Method: method , Size: UserPreference.sharedInstance.brewSize, Length: length, userNotes: "", roast: UserPreference.sharedInstance.roastTypeDisplay());
            notes.append(newNote);
            
            
        }else{
            checkStep();
            stepLabel.text = steps[stepTracker];
            seconds += 1
            timeLabel.text = formatTimer(time: seconds);
        }
        
        
    }
    func checkStep(){
        switch method {
            case .V60:
                if (seconds==45){
                    stepTracker+=1;
                }
                else if (seconds==75){
                    stepTracker+=1;
                }
            case .FrenchPress:
                if (seconds==45){
                    stepTracker+=1;
                }
                else if (seconds==(length-15)){
                    stepTracker+=1;
                }
           
            case .AeroPress:
                if (seconds==15){
                    stepTracker+=1;
                }
                else if (seconds==(length-15)){
                    stepTracker+=1;
                }
            
            
        }
        
        
        
        

    }
    func formatTimer(time: Int) -> String {
        let minute = Int(time) / 60 % 60;
        let second = Int(time) % 60
        if (second<10){
            return "0\(minute):0\(second)";
        }
        else {
            return "0\(minute):\(second)";}
        
    }
    
}
