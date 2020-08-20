//
//  MenuViewController.swift
//  SimpleSideMenu
//
//  Created by Raju Gupta on 19/08/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index: Int)
}

class MenuViewController: UIViewController {
    
    var itemArr = ["Home", "About", "Contact"]
    var iconArr = [UIImage(systemName: "house.fill"), UIImage(systemName: "info.circle.fill"), UIImage(systemName: "phone.circle.fill")]
    
    @IBOutlet weak var btnLogo: UIButton!
    @IBOutlet weak var btnMenuCloseOverlay: UIButton!
    var btnMenu : UIButton!
    var delegate : SlideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK:- Closing Side Menu
    @IBAction func onClickMenuCloseOverlay(_ sender: UIButton) {
        btnMenu.tag = 0
        btnMenu.isHidden = false
        if (self.delegate != nil){
            var index = Int(sender.tag)
            if sender == self.btnMenuCloseOverlay{
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }) { (finished) in
            self.view.removeFromSuperview()
            self.removeFromParent()
        }
    }
    
    @IBAction func onClickLogo(_ sender : UIButton){
        let vc = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.pushViewController(vc, animated: true)
    }
        
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuOptionCell", for: indexPath) as! MenuOptionCell
        cell.imgIcon.image = iconArr[indexPath.row]
        cell.lblName.text = itemArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = storyboard?.instantiateViewController(identifier: "AboutViewController") as! AboutViewController
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = storyboard?.instantiateViewController(identifier: "ContactViewController") as! ContactViewController
            navigationController?.pushViewController(vc, animated: true)
        
        default:
            let vc = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
