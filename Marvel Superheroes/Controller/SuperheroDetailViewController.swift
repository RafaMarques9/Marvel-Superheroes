//
//  SuperheroDetailViewController.swift
//  Marvel Superheroes
//
//  Created by Rafa Marques on 15.11.17.
//  Copyright © 2017 Rafa Marques. All rights reserved.
//

import UIKit

class SuperheroDetailViewController: UIViewController {
    
    var superheroData: MarvelCharacter?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var comicCountLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let superhero = superheroData {
            self.navigationItem.title = superhero.name
        }
        
        showSuperheroData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showSuperheroData() {
        if let superhero = superheroData {
            print("Name: \(superhero.name)")
            print("Description: \(superhero.description)")
            print("Image: \(superhero.thumbnailPath).\(superhero.thumbnailExtension)")
            print("Comic Count: \(superhero.comicCount)")
            
            
            nameLabel.text = superhero.name
            if superhero.description != "" {
                descriptionLabel.text = superhero.description
            } else {
                descriptionLabel.text = "No description available!"
            }
            comicCountLabel.text = String(superhero.comicCount) + " Comics"
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
