//
//  ViewController.swift
//  OpacPLUS
//
//  Created by Iura Gutu on 18/03/16.
//  Copyright © 2016 deCode. All rights reserved.
//

import UIKit

class InfoController: UIViewController,UITextFieldDelegate {

    @IBOutlet var dropDownTextField: UITextField!
    @IBOutlet var downPicker: DownPicker!;
    @IBOutlet var langArray = [NSString]();
    @IBOutlet var user: User!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
  
        user = User.readFromFile();
        
        
        langArray.append("EN");
        langArray.append("DE");
        
        
        
        downPicker = DownPicker(textField: dropDownTextField, withData: langArray);
        
        dropDownTextField.delegate = self;
        
        downPicker.selectedIndex = Int(user.langChoice);
        //downPicker.setSelectedIndex = Int(user.langChoice);
        downPicker.setValueAtIndex(Int(user.langChoice));
        downPicker.addTarget(self, action: "dp_Selected:", forControlEvents: UIControlEvents.ValueChanged)
        
        

       
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        
        
        
        
   
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        
        
        if (langArray.count > 0) {
            downPicker.showPicker(textField);
            return true;
        }
        return false;
        
       
    }
    
    
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated);
        
        var text = dropDownTextField.text
        
        if( text == "EN" ){
            user.langChoice = Int32(0);
        }
        else{
            user.langChoice = Int32(1);
        }
        
        
        
        user.saveToFile();
        
        
        
    }
    
    func dp_Selected(dp: AnyObject) {
        
        user.langChoice = Int32(downPicker.selectedIndex);
        user.saveToFile();
    }
    

}

