//
//  ViewController.swift
//  ReadApi
//
//  Created by Tao Trong Nghia on 8/31/20.
//  Copyright © 2020 Tao Trong Nghia. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
//    var arrName = ["Nghia", "Son", "Quang", "Nam"]
//    var arrAge = ["18", "19", "20", "21"]
//    var arrGender = ["Nam", "Nam", "Nam", "Nam"]
//    var arrLocation = ["Thanh Hoa", "Bac Ninh", "Thai Binh", "Ha Nam"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locate.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        
        cell.setUp(data: locate[indexPath.row])
//        cell.lblUser.text = "\(arrName[indexPath.row])"
//        cell.lblAge.text = "\(arrAge[indexPath.row])"
//        cell.lblGender.text = "\(arrGender[indexPath.row])"
//        cell.lblLocation.text = "\(arrLocation[indexPath.row])"
//        cell.imageView?.image = UIImage(named: "04")
        return cell
    }
    
    
    @IBOutlet weak var lblNodata: UILabel!
    let cellIdentifier = "TableViewCell"
    @IBOutlet weak var tableView: UITableView!
    var locate = [Location]()
    var refreshControl = UIRefreshControl()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    func loadData(){
        let url = URL(string: "http://demo0737597.mockable.io/master_data")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    let loadData = try JSONDecoder().decode(Data.self, from: data!)
                    self.locate = loadData.data
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        
                        self.lblNodata.isHidden = !(self.locate.count == 0)
                        if self.locate.count != 0 {
                            self.lblNodata.isHidden = true
                        } else {
                            self.lblNodata.isHidden = false
                        }
                    }
                } catch {
                    print("Loi!!!")
                }

            }
        }
        task.resume()
    }
    
    @objc func refresh(_ sender: UIRefreshControl){
        sender.endRefreshing()
        self.tableView.reloadData()
    }


}

