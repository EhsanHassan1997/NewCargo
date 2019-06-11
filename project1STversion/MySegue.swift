//
//  MySegue.swift
//  project1STversion
//
//  Created by Apple on 6/10/19.
//  Copyright © 2019 Omar Kelany. All rights reserved.
//

import UIKit

class MySegue: UIStoryboardSegue {
    
    override func perform() {
        let to = self.destination
        let from = self.source
        to.view.center = from.view.center
        from.view.superview?.addSubview(to.view)
        from.present(to, animated: false, completion: nil)
        //to.transition(from: from, to: to, duration: 0.5, options: .allowUserInteraction, animations: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
    }

}
