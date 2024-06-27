//
//  ViewController.swift
//  SideMenu
//
//  Created by Manyuchi, Carrington C on 2024/06/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewOpen: Bool = true
    
    var titleNames = ["Profile", "Edit Profile", "Support", "Settings"]
    var images = ["profile", "editProfile", "support" , "setting"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // method calling
        registerTableCells()
        self.containerView.isHidden = true
        viewOpen = false
        tableView.backgroundColor = .black
    }
    
    func registerTableCells() {
        tableView.register(UINib(nibName: "TitleTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleTableViewCell")
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        self.containerView.isHidden = false
        tableView.isHidden = false
        
        if !viewOpen {
            viewOpen = true
            containerView.frame  = CGRect(x: 0, y: 103, width: 0, height: 715)
            tableView.frame = CGRect(x: 0, y: 0, width: 0, height: 715)
            
            UIView.animate(withDuration: 1) {
                self.containerView.frame  = CGRect(x: 0, y: 103, width: 240, height: 715)
                self.tableView.frame = CGRect(x: 0, y: 0, width: 240, height: 715)
            }
    
        } else {
            containerView.isHidden = true
            tableView.isHidden = true
            viewOpen = false
            containerView.frame  = CGRect(x: 0, y: 103, width: 0, height: 715)
            tableView.frame = CGRect(x: 0, y: 0, width: 0, height: 715)
            UIView.animate(withDuration: 2) {
                self.containerView.frame  = CGRect(x: 0, y: 103, width: 240, height: 715)
                self.tableView.frame = CGRect(x: 0, y: 0, width: 240, height: 715)
            }
        }
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleNames.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell", for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        
        cell.titleLabel.text = titleNames[indexPath.row]
       // cell.imageIcon.image = UIImage(named: images[indexPath.row])
        cell.backgroundColor = .black
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let vc  = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
