//
//  MenuViewController.swift
//  alsabha
//
//  Created by Mostafa AbdEl Fatah on 10/22/18.
//  Copyright © 2018 Mostafa AbdEl Fatah. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var delegate:MenuViewControllerDelegate?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.textsLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" )  ?? UITableViewCell()
        cell.textLabel?.text = Constants.textsLists[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.setTextToLabel(index: indexPath.row)
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func backgroundViewTabed(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
}


