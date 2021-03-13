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
    var timer = Timer();
    var seconds = 0;
    var isTimerRunning = false;
    var length = 60;

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var methodLabel: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func setup(){
        
    }
    @IBAction func runTimer(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateLabel)), userInfo: nil, repeats: true)
        isTimerRunning = true;
    }
    @IBAction func stopTimer(_ sender: UIButton) {
        timer.invalidate();
        isTimerRunning = false;
        timeLabel.text = "00:00";
        
    }
    @objc func updateLabel(){
        if (seconds >= length){
            timer.invalidate();
        }else{
            seconds += 1
            timeLabel.text = formatTimer(time: seconds);
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
