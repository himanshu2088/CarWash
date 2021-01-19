//
//  HomeViewController.swift
//  CarWash
//
//  Created by Himanshu Joshi on 04/01/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var bookBtn: UIButton!
    
    @IBAction func bookBtnPressed(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BookViewController") as! BookViewController
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookBtn.layer.cornerRadius = 25.0
        
    }

}
