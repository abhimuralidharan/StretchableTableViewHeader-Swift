//
//  ViewController.swift
//  StretchableTableViewHeader
//
//  Created by Apple on 29/08/17.
//  Copyright © 2017 Abhilash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 50
        tableView.contentInset = UIEdgeInsetsMake(300, 0, 0, 0)
        tableView.backgroundColor = UIColor.darkGray
        
        
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        imageView.image = UIImage.init(named: "poster")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        switch indexPath.row % 2 {
        case 0:
            cell.titleLabel.text = "Lorem Ipsum is simply dummy text ."
            cell.contentView.backgroundColor = UIColor.darkGray
        default:
            cell.contentView.backgroundColor = UIColor.black
            cell.titleLabel.text = "There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..."
            cell.titleLabel.textColor = .white


        }
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
     let y = 300 - (scrollView.contentOffset.y + 300)
        let height = min(max(y, 60), 400)
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)


    }
}
