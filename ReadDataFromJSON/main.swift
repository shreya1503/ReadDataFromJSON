//
//  main.swift
//  ReadDataFromJSON
//
//  Created by MacStudent on 2020-02-19.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation

func readTextFile(fileName : String)
{
    print(Bundle.main.bundlePath)
   if let path = Bundle.main.path(forResource: fileName, ofType: "txt")
   {
        //print(path)
    
        let str = try? String(contentsOfFile: path)
    
        if let s = str
        {
            print(s)
        }
        else
        {
            print("Error While Reading Data")
        }
    
    }
}

//readTextFile(fileName: "data")

func readJSONUserInfo(fileName : String)
{
     let filePath = Bundle.main.url(forResource: fileName, withExtension: "json")

         guard let path = filePath else
         {
            print("Invalid File Path")
            return
        }
        
        guard let data = try? Data(contentsOf: path)
        else
        {
            print("Error While Read Data From Url")
            return
        }
    
    guard let json = try? JSONSerialization.jsonObject(with: data, options: [])
    else
    {
        print("Error While Reading JSON Data From file")
        return
    }
 
    //print(json)

    if let userDictionary = json as? [String : Any]
    {
        //print(userDictionary)
         let id = userDictionary["id"] ?? "No ID Found"
         print(id)
    
        let name = userDictionary["name"] ?? "No Name Found"
        print(name)
        
        let username = userDictionary["username"] ?? "No UserName Found"
        print(username)
        
        let email = userDictionary["email"] ?? "No Email Found"
        print(email)
        
        let phone = userDictionary["phone"] ?? "No Phone Found"
        print(phone)
        
        let website = userDictionary["website"] ?? "No Website Found"
        print(website)
        
        
        if let addressDictionary = userDictionary["address"] as? [String : Any]
        {
            print(addressDictionary["city"]!)
        }
            
    }
    
}

readJSONUserInfo(fileName : "SingleUser")
