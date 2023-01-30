//
//  PlanetListTableView.swift
//  Planet
//
//  Created by Dominique Strachan on 12/15/22.
//

import UIKit

class PlanetListTableView: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Solar System"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //this gets called whenever view appears
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return PlanetController.planets.count   //8
    }

    //what data do you want in your cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planetCell", for: indexPath)
        
        //this is holding planet object
        //accessing array of plants and placing in row??
        let planet = PlanetController.planets[indexPath.row]
        
        //start creating the content
        //INSTANCE OR window into cell
        //accessing default configuation of a cell
        //up to this point, cell doesn't have any styling
        var newContent = cell.defaultContentConfiguration()
        
        //planet name
        newContent.text = planet.planetName
        newContent.textProperties.color = .label
        newContent.textProperties.font = UIFont.preferredFont(forTextStyle: .headline)
        newContent.textToSecondaryTextVerticalPadding = 4
        
        //planet type
        newContent.secondaryText = planet.planetType
        newContent.secondaryTextProperties.color = .label
        newContent.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .subheadline)
        //newContent.secondaryTextToSecondaryTextVerticalPadding = 4
        
        //image
        newContent.image = UIImage(systemName: planet.isFavorite ? "circle.fill" : "circle" )
        newContent.imageProperties.tintColor = .systemPurple
        newContent.imageToTextPadding = 16

        
        //link up the new content styling the cell
        cell.contentConfiguration = newContent
        
        //your new and improved cell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        70
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    //handles teammate throwing football
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        //verify the segue is the correct one, by checking the segue ID
        if segue.identifier == "toDetailView" {
            //Identify where it is we want to segue to
            guard let destinationViewController =
                    segue.destination as? PlanetDetailView else {
                print("there was an error with the destinationViewController")
                return
            }
            
            //identify what row was tapped on (the index)
            guard let indexPath = tableView.indexPathForSelectedRow else {
                print("there was an error with obtaining the index path")
                return
            }
            
            //identify what is we want to pass along
            let selectedPlanet = PlanetController.planets[indexPath.row]
            
            //reception - making the pass
            destinationViewController.planet = selectedPlanet
        }
        
    }

}
