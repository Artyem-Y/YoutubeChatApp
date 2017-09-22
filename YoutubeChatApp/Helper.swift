//
//  Helper.swift
//  Youtube Chat App
//
//  Created by Artem on 22.09.17.
//  Copyright © 2017 theswiftproject. All rights reserved.
//

import Foundation
import UIKit


class Helper {
    
    static let helper = Helper()
    
    func switchToNavigationVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "profilesVC") as! UINavigationController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = vc
    }
}
