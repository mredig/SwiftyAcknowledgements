//
//  ViewController.swift
//  tvOS Example
//
//  Created by Mathias Nagler on 27.10.15.
//  Copyright © 2015 Mathias Nagler. All rights reserved.
//

import UIKit
import SwiftyAcknowledgements

class ViewController: UIViewController {

    @IBAction func showAcknowledgements() {
        let vc = AcknowledgementsTableViewController()
        vc.headerText = "SwiftyAcknowledgements makes use of the following third party libraries:"
		vc.footerText = "Third party libraries integrated using Swift Package Manager"

        vc.acknowledgements.append(Acknowledgement(title: "Custom Acknowledgement", text: "This is a custom acknowledgement added via code."))
        
        navigationController?.pushViewController(vc, animated: true)
    }

}

