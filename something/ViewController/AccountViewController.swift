//
//  AccountViewController.swift
//  something
//
//  Created by 김동현 on 2017. 11. 5..
//  Copyright © 2017년 John Kim. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift


class AccountViewController : UIViewController {
    override func  viewDidAppear(_ animated: Bool) {
       print(Realm.Configuration.defaultConfiguration.fileURL!)//only for simulator
        
    }
}
