//
//  BookDetailViewController.swift
//  ProlificLib
//
//  Created by manik lamba on 02/03/18.
//  Copyright © 2018 manik lamba. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthors: UILabel!
    @IBOutlet weak var bookPublisher: UILabel!
    @IBOutlet weak var bookCheckout: UILabel!
    @IBOutlet weak var bookCategory: UILabel!
    
    var currentBookDO = BookDO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
          print (self.currentBookDO)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.bookTitle.text = self.currentBookDO.title
        self.bookAuthors.text = self.currentBookDO.author

        if let publisherName = self.currentBookDO.publisher {
         self.bookPublisher.text = "Publisher: " + publisherName
        }
        else{
            self.bookPublisher.isHidden = true
        }
        
        if let bookTags = self.currentBookDO.categories {
            self.bookCategory.text = "Tags: " + bookTags
        }
        else{
            self.bookCategory.isHidden = true
        }
        
        if let bookCheckoutBy = self.currentBookDO.lastCheckoutBy {
            self.bookCheckout.text = "Last Checked Out:\(bookCheckoutBy) @ \(self.currentBookDO.lastCheckout ?? "")"
        }
        else{
            self.bookCheckout.isHidden = true
        }
        
        let shareBarButton = UIButton()
        shareBarButton.setImage(UIImage(named:"share"), for: .normal)
        shareBarButton.addTarget(self, action: #selector (BookDetailViewController.share) , for: .touchUpInside)
        self.navigationItem.setRightBarButton(UIBarButtonItem(customView:shareBarButton), animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkoutBook(_ sender: UIButton) {
    
    }
    
   @objc func share() {
        let textToShare = [ self.bookTitle.text!]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.addToReadingList,UIActivityType.openInIBooks,UIActivityType.markupAsPDF,UIActivityType.print]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
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
