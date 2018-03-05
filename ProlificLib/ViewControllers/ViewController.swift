//
//  ViewController.swift
//  ProlificLib
//
//  Created by manik lamba on 02/03/18.
//  Copyright © 2018 manik lamba. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    lazy var bookArray = [BookDO]()
    
    @IBOutlet weak var bookTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        //Verify Changes
        // Do any additional setup after loading the view, typically from a nib.
    }

    func fetchData(){
        let endPointURLString = constant.getBooks
        guard let endPointURL = URL(string:endPointURLString) else {return}
        var request = URLRequest(url:endPointURL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request)  { (data, response, err) in
            guard let data = data else {return}
            do {
                let jsonDecoder = JSONDecoder()
                let books = try jsonDecoder.decode([BookDO].self,from:data)
                self.bookArray = books
                DispatchQueue.main.async {
                    self.bookTableView.reloadData()
                }
            }
            catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    
//    func formLabel(title:String,font:UIFont,numberOflines:Int) -> UILabel {
//        let label = UILabel()
//        label.text = title
//        label.font = font
//        label.numberOfLines = numberOflines
//        return label
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        self.bookArray [(self.bookTableView.indexPathForSelectedRow?.row)!]
        if let vc = segue.destination as? BookDetailViewController {
            vc.currentBookDO = self.bookArray[(self.bookTableView.indexPathForSelectedRow?.row)!]
        }
    }

}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.bookArray.count)
        return self.bookArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        let cell : UITableViewCell? = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) else {
                return UITableViewCell.init(style: .subtitle, reuseIdentifier: cellIdentifier)
            }
            return cell
        }()
        cell?.textLabel?.text = bookArray[indexPath.row].title
        cell?.textLabel?.font = UIFont(name: "Helvetica-Medium", size: 14)
        cell?.textLabel?.numberOfLines = 0

        cell?.detailTextLabel?.text = bookArray[indexPath.row].author
        cell?.detailTextLabel?.font = UIFont(name: "Helvetica", size: 12)
        cell?.detailTextLabel?.numberOfLines = 0

        return cell!
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "viewBookDetails", sender: nil)
    }
    
    
}

struct PersonDO{
    var name:String
    var age:Int
}
