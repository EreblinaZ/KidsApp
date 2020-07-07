//
//  StoryViewController.swift
//  KidsApplication
//
//  Created by macos on 7/7/20.
//  Copyright © 2020 macos. All rights reserved.
//

import UIKit
import SQLite3

class StoryViewController: UIViewController {

    var db: OpaquePointer?
    
    @IBOutlet weak var textFieldTitle: UITextField!

    @IBOutlet weak var textFieldAuthor: UITextField!
    
    
    @IBAction func buttonSave(_ sender: Any) {
        
        let title = textFieldTitle.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let author = textFieldAuthor.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if(title?.isEmpty)!{
            let alertTitle = UIAlertController(title:"Error!", message:"Title is empty!", preferredStyle: .alert)
            alertTitle.addAction(UIAlertAction(title:"Try Again", style: .default, handler:nil))
            self.present(alertTitle, animated: true, completion: nil)
        }
        
        if(author?.isEmpty)!{
            let alertAuthor = UIAlertController(title:"Error!", message:"Author is empty!", preferredStyle: .alert)
            alertAuthor.addAction(UIAlertAction(title:"Try Again", style: .default, handler:nil))
            self.present(alertAuthor, animated: true, completion: nil)
            
        }
        
        var stmt: OpaquePointer?
        
        let insertQuery = "INSERT INTO Stories (title, author) VALUES (?, ?)"
        
        if sqlite3_prepare(db, insertQuery, -1, &stmt, nil) != SQLITE_OK {
            print("Error binding query")
        }
        
        if sqlite3_bind_text(stmt, 1, title, -1, nil) != SQLITE_OK {
            print("Error binding title")
        }
        
        if sqlite3_bind_text(stmt, 2, author, -1, nil) != SQLITE_OK {
            print("Error binding author")
        }
        
        if sqlite3_step(stmt) == SQLITE_DONE {
            let alertStory = UIAlertController(title:"Succes!", message:"Story saved successfully!", preferredStyle: .alert)
            alertStory.addAction(UIAlertAction(title:"Done", style: .default, handler:nil))
            self.present(alertStory, animated: true, completion: nil)        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let fileUrl = try!
            FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StoriesDatabase.sqlite")
        
        if sqlite3_open(fileUrl.path, &db) != SQLITE_OK {
            print("Error opening database")
            return
        }
        
        let createTableQuery = "CREATE TABLE IF NOT EXISTS Stories (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, author TEXT)"
        
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK{
            print("Error creating table")
            return
        }
        
        print("Everything is fine")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
