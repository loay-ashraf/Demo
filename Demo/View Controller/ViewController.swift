//
//  ViewController.swift
//  Demo
//
//  Created by Loay Ashraf on 10/03/2022.
//

import UIKit

class ViewController: UITableViewController {

    let placeholderData = ["staff",
                            "personnel",
                            "students",
                            "programs",
                            "faculties",
                            "activities",
                            "careers",
                            "grading system",
                            "How to enroll",
                            "News"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.backgroundView = {
            let imageView = UIImageView(image: UIImage(systemName: "globe"))
            imageView.backgroundColor = .systemBlue
            imageView.tintColor = .blue.withAlphaComponent(0.1)
            return imageView
        }()
    }

}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
            return cell
        }()
            
        cell.textLabel?.text = "* \(placeholderData[indexPath.row])"
        cell.textLabel?.font = .boldSystemFont(ofSize: 25)
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .clear
            
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "DetailVC")
        present(detailVC, animated: true, completion: nil)
    }
    
}
