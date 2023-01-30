//
//  PlanetDetailView.swift
//  Planet
//
//  Created by Dominique Strachan on 12/15/22.
//

import UIKit

class PlanetDetailView: UIViewController {
    
    @IBOutlet weak var planetImageView: UIImageView!
    
    @IBOutlet weak var planetOrderLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var planetDescriptionLabel: UILabel!
    
    @IBOutlet weak var planetTypeLabel: UILabel!
    
    @IBOutlet weak var planetDistanceFromSunLabel: UILabel!
    
    @IBOutlet weak var moonCountLabel: UILabel!
    
    @IBOutlet weak var ringCountLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    //landing pad
    var planet: Planet?
    
    //gets called when the view controller comes into view
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        //fav button color
        favoriteButton.tintColor = .systemPurple
        //back button's color
        self.navigationController?.navigationBar.tintColor = .systemPurple
        updateFavoriteStatus()

        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        guard let unwrappedPlanet = planet else {
            print("There was an issue with the planet object was passed in")
            return
        }
        planetImageView.image = UIImage(named: unwrappedPlanet.imageName)
        nameLabel.text = unwrappedPlanet.planetName
        planetDescriptionLabel.text = unwrappedPlanet.planetDescription
        
        planetTypeLabel.text = unwrappedPlanet.planetType
    
        planetDistanceFromSunLabel.text = "\(unwrappedPlanet.distanceFromSun) AU from Sun"
        
        ringCountLabel.text = "Rings: \(unwrappedPlanet.ringCount)"
        moonCountLabel.text = "Rings: \(unwrappedPlanet.moonCount)"
        
        planetOrderLabel.text = "\(unwrappedPlanet.orderNumber)"
    }
    
    func updateFavoriteStatus() {
        guard let planet = planet else {return}
        
        favoriteButton.image = UIImage(systemName:
                                        planet.isFavorite ?
                                       //true
                                       "star.circle.fill" :
                                       //false
                                       "star.circle"
        )
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        guard let planet = planet else {
            return //exit
        }
        //toggle the isFavorite property
        PlanetController.updateFavorite(planet: planet)
        updateFavoriteStatus()
    }
    
}
