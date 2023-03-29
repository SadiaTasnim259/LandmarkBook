//
//  SecondViewController.swift
//  LandmarkBook
//
//  Created by Sadia on 29/3/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    
    var placeName = ""
    var placeImage: UIImage? = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = placeName
        imageLabel.image = placeImage
        
    }
}
