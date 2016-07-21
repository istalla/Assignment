//
//  ViewController.swift
//  Swift_Sample
//
//  Created by Raju Istalla on 18/07/16.
//  Copyright © 2016 Raju Istalla. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, ListViewControllerDelegate {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    var emailString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didFinishTask(listArray : NSMutableArray)
    {
        // dataString from SecondVC
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let listViewController = storyboard.instantiateViewControllerWithIdentifier("ListViewController") as! ListViewController
        listViewController.itemsArray = listArray
        self.navigationController?.pushViewController(listViewController, animated: true)
    }
    
    @IBAction func submitButtonClicked(sender: AnyObject) {
    
        emailTextField.resignFirstResponder()
        if emailString.isEmpty {
            showAlert()
        }
        else{
            let requestHandler = RequestHandler()
            requestHandler.delegate = self
            requestHandler.sendRequest(emailString)
        }
    
    }

    func showAlert() {
        let alertController = UIAlertController(title: "Enter Email", message: "Email field should not empty", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
    
        emailString = emailTextField.text! as String
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true;
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        return true;
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return true;
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return true;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }

}

