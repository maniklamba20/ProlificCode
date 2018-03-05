//
//  AddBookViewController.swift
//  ProlificLib
//
//  Created by manik lamba on 02/03/18.
//  Copyright © 2018 manik lamba. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let doneBarButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector (done))
        self.navigationItem.setRightBarButton(doneBarButton, animated: true)

        // Do any additional setup after loading the view.
    }

    @objc func done(){
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
