//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Naif Alrashed on 11/30/16.
//  Copyright © 2016 Naif Alrashed. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    var image: UIImage!
    var message: String!
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var resultsOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    override func viewWillAppear(_ animated: Bool) {
        imageView = UIImageView()
        resultsOutput = UILabel()
        resultsOutput.text = message
        imageView.image = image
        
    }

    @IBAction func dismissButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
