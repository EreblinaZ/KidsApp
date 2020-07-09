//
//  ColorsViewController.swift
//  KidsApplication
//
//  Created by macos on 7/9/20.
//  Copyright © 2020 macos. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let colors = ["Red","Orange","Yellow","Green","Blue","Beige","Pink","Grey","Brown","Black","White"]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        cell.colorLbl.text = colors[indexPath.row]
        cell.colorImage.image = UIImage(named:colors[indexPath.row])
        return cell
    }

}
