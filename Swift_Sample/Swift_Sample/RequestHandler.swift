//
//  RequestHandler.swift
//  Swift_Sample
//
//  Created by Raju Istalla on 20/07/16.
//  Copyright © 2016 Raju Istalla. All rights reserved.
//

import UIKit

protocol ListViewControllerDelegate: class {
    func didFinishTask(listArray: NSMutableArray)
}


class RequestHandler: NSObject {

    weak var delegate:ListViewControllerDelegate?
    
    func sendRequest(emailString : String)
    {
    let url:NSURL = NSURL(string: "http://surya-interview.appspot.com/list")!
    
    let emailDict: [String: String] =
        ["emailId" : emailString]
    let request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
    
    do {
    let  data = try NSJSONSerialization.dataWithJSONObject(emailDict, options:[])
    request.HTTPBody = data
    request.HTTPMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json",forHTTPHeaderField: "Accept")
    
    } catch {
    
    }
    
    
    let config = NSURLSessionConfiguration.defaultSessionConfiguration()
    let session = NSURLSession(configuration: config)
    
    let task = session.dataTaskWithRequest(request, completionHandler: {(postData, response, error) in
        do
        {
            let JSONResult = try NSJSONSerialization.JSONObjectWithData(postData!, options:[]) as! [String : AnyObject]
            var itemsArray:NSMutableArray! = NSMutableArray()
            itemsArray  = JSONResult["items"] as! NSMutableArray
            print("Body: \(itemsArray)")
            self.delegate?.didFinishTask(itemsArray)
        }catch
        {
        }
        print(response)
        
    });
    
    task.resume()
    
}

}
