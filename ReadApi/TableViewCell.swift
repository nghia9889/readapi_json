//
//  TableViewCell.swift
//  ReadApi
//
//  Created by Tao Trong Nghia on 8/31/20.
//  Copyright © 2020 Tao Trong Nghia. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUp(data : Location){
        self.lblUser.text = "\(data.userName)"
        self.lblAge.text = "\(data.age)"
        self.lblGender.text = "\(data.gender)"
        self.lblLocation.text = "\(data.location)"
        
        let imageURL = URL(string: data.image)
            let task = URLSession.shared.dataTask(with: imageURL!) { (data, response, error) in
                if error == nil {
                    guard let imageData = data else {return}
                    let loadedImage = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        self.imageView?.image = loadedImage
                    }
                }
            }
            task.resume()
        }
    }
    
