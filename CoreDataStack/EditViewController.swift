//
//  EditViewController.swift
//  CoreDataStack
//
//  Created by Fahir Mehovic on 8/18/15.
//  Copyright © 2015 Fahir Mehovic. All rights reserved.
//

import UIKit
import CoreData


class EditViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    
    var students: [Student] = [];
    var context: NSManagedObjectContext!;
    var index: Int?;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        loadData();
        textField.enabled = false;
        textField.text = students[index!].name;
        
    }
    
    func loadData() {
        let request = NSFetchRequest(entityName: "Student");
        
        students = try! context.executeFetchRequest(request) as! [Student];
        
    }
    
    @IBAction func commitChanges(sender: AnyObject) {
        
        students[index!].name = textField.text
        
        try! context.save()
        
        textField.enabled = false;
        editBtn.hidden = false;
        cancelBtn.hidden = true;
        okBtn.hidden = true;
    }
    
    
    @IBAction func cancelChanges(sender: AnyObject) {
        
        
        textField.enabled = false;
        editBtn.hidden = false;
        cancelBtn.hidden = true;
        okBtn.hidden = true;
    }
    
    
    @IBAction func editData(sender: AnyObject) {
        
        textField.enabled = true;
        editBtn.hidden = true;
        cancelBtn.hidden = false;
        okBtn.hidden = false;
        
    }
    
    
    
    
}

















































