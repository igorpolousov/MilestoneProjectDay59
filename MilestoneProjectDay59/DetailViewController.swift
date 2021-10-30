//
//  DetailViewController.swift
//  MilestoneProjectDay59
//
//  Created by Igor Polousov on 26.10.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var countryDescription: UILabel!
    
    var selectedImage: String?
    var titleLoad: String?
    var info: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        if let titleToLoad = titleLoad {
            title = titleToLoad
        }
        
        if let texttoLoad = info {
            countryDescription.text = texttoLoad
        }
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.systemGray.cgColor
        imageView.layer.cornerRadius = 8
    }
    

}
