//
//  ViewController.swift
//  OpacPLUS
//
//  Created by Iura Gutu on 18/03/16.
//  Copyright © 2016 deCode. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet var webView: UIWebView!
    @IBOutlet var user: User!;
    var lastLang: Int32 = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user = User.readFromFile();
        
        if( user == nil )
        {
            user = User();
            user.saveToFile();
            
        }
        
        user.langChoice = 1;
        user.saveToFile();
        
        lastLang = 1;
        
        var userLink: String!;

        userLink = "https://opacplus.bsb-muenchen.de/metaopac/start.do";
        
        
        webView.loadRequest(NSURLRequest(URL: NSURL(string: userLink)!))
            
            
        
   
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        
        user = User.readFromFile();
        
        if( lastLang != user.langChoice ){
            
            var userLink: String!;
            
            if( user.langChoice == 0 ){
                userLink = "https://opacplus.bsb-muenchen.de/metaopac/search.do?methodToCall=selectLanguage&Language=en";
            }
            else{
                userLink = "https://opacplus.bsb-muenchen.de/metaopac/search.do?methodToCall=selectLanguage&Language=de";
            }
            
            webView.loadRequest(NSURLRequest(URL: NSURL(string: userLink)!))
            lastLang = user.langChoice
        
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onHomePressed(sender: AnyObject) {
        
        
        var userLink: String!;
        
        switch user.langChoice {
        case 0:
            userLink = "https://opacplus.bsb-muenchen.de/metaopac/search.do?methodToCall=selectLanguage&Language=en";
            break
            
        case 1:
            userLink = "https://opacplus.bsb-muenchen.de/metaopac/start.do?methodToCall=selectLanguage&Language=de";
            break
            
        default:
            userLink = "https://opacplus.bsb-muenchen.de/metaopac/start.do?methodToCall=selectLanguage&Language=de";
        }
        
        
        
        webView.loadRequest(NSURLRequest(URL: NSURL(string: userLink)!))
        
        
    }

    @IBAction func onSearchPressed(sender: AnyObject) {
        
        
        webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://opacplus.bsb-muenchen.de/metaopac/search.do?methodToCall=switchSearchPage&SearchType=2&emptyFields=true")!))
        
        
    }
    
    @IBAction func onAccountPressed(sender: AnyObject) {
        
        webView.loadRequest(NSURLRequest(URL: NSURL(string: "https://opacplus.bsb-muenchen.de/metaopac/userAccount.do?methodToCall=start")!))
        
        
    }
    
    @IBAction func onInfoPressed(sender: AnyObject) {
    }
}

