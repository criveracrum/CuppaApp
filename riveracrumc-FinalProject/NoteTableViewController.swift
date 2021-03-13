//
//  NoteTableViewController.swift
//  riveracrumc-FinalProject
//
//  Created by Chadwick on 3/13/21.
//

import UIKit

struct Note {
    var Date : String;
    var Method : Brews;
    var Size : Int;
    var Length : Int;
    var roast : String;
    
    var userNotes: String;
    
    init(Date: String, Method : Brews, Size: Int, Length : Int, userNotes: String, roast: String) {
        self.Date = Date;
        self.Method = Method;
        self.Size = Size;
        self.Length = Length
        self.userNotes = "";
        self.roast = roast;
    }
    mutating func setNoteText(note: String){
        self.userNotes = note;
    }
    
    
}

var notes : [Note] = [];

class NoteTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let test = Note(Date: "08/12/21", Method: .V60, Size: 500, Length: 120, userNotes: "None", roast: "Light")
        notes.append(test)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "date", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].Date
        // Configure the cell...

        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let NoteViewController = segue.destination as? NoteViewController {
            if let indexPath = self.tableView.indexPathForSelectedRow{
                NoteViewController.curNote =
                    notes[indexPath.row]
            }
            
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
