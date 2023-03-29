//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Sadia on 29/3/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //var imageArray = [UIImage?]()
    var nameArray = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        nameArray = ["Ahsan Manzil", "Shahid Minar", "Lalbag Fort", "Jatiyo Sriti Shoudho", "Sonargaon", "National Parliament House", "Jaflong", "Mainimati Ruins"]
//        imageArray = [UIImage(named: "Ahsan Manzil"), UIImage(named: "Shahid Minar"), UIImage(named: "Lalbag Fort"), UIImage(named: "Jatiyo Sriti Shoudho"), UIImage(named: "Sonargaon"), UIImage(named: "National Parliament House"), UIImage(named: "Jaflong"), UIImage(named: "Mainimati Ruins") ]
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        cell.textLabel?.text = nameArray[indexPath.row]
        //cell.imageView?.image = UIImage(named: nameArray[indexPath.row])
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imageName = nameArray[indexPath.row]
        
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondViewController.placeName = imageName
        secondViewController.placeImage = UIImage(named: imageName)
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.nameArray.remove(at: indexPath.row)// array theke remove korche data
            tableView.deleteRows(at: [indexPath], with: .right)// tableView theke cell remove korche
            //array & tableView 2 ta thekei delete korte hobe nahole app crash korbe
        }
    }
    
}


