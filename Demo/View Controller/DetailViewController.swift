//
//  DetailViewController.swift
//  Demo
//
//  Created by Loay Ashraf on 10/03/2022.
//

import UIKit
import SideMenuSwift
import FSPagerView

class DetailViewController: UITableViewController {
    
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
    
    @IBOutlet weak var backwardButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.itemSize = FSPagerView.automaticSize
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SideMenuController.preferences.basic.menuWidth = 240
        SideMenuController.preferences.basic.position = .above
        SideMenuController.preferences.basic.direction = .right
        SideMenuController.preferences.basic.enablePanGesture = true
        SideMenuController.preferences.basic.supportedOrientations = .portrait
        SideMenuController.preferences.basic.shouldRespectLanguageDirection = true
        pagerView.bringSubviewToFront(backwardButton)
        pagerView.bringSubviewToFront(forwardButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        fitTableHeaderView()
        fitTableFooterView()
    }
    
    func fitTableHeaderView() {
        guard let headerView = tableView.tableHeaderView else {
            return
        }
        let size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        if headerView.frame.size.height != size.height {
            headerView.frame.size.height = size.height
            tableView.tableHeaderView = headerView
            tableView.layoutIfNeeded()
        }
    }

    func fitTableFooterView() {
        guard let footerView = tableView.tableFooterView else {
            return
        }
        let size = footerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        if footerView.frame.size.height != size.height {
            footerView.frame.size.height = size.height
            tableView.tableFooterView = footerView
            tableView.layoutIfNeeded()
        }
    }
    
    @IBAction func showSideMenu(_ sender: UITapGestureRecognizer) {
        sideMenuController?.revealMenu()
    }
    
    @IBAction func previousImage(_ sender: UIButton) {
        let prevIndex = pagerView.currentIndex > 0 ? pagerView.currentIndex - 1 : numberOfItems(in:self.pagerView) - 1
        pagerView.scrollToItem(at: prevIndex, animated: true)
    }
    
    @IBAction func nextImage(_ sender: UIButton) {
        let nextIndex = pagerView.currentIndex + 1 < numberOfItems(in:self.pagerView) ? pagerView.currentIndex + 1 : 0
        pagerView.scrollToItem(at: nextIndex, animated: true)
    }
    
}

extension DetailViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
            return cell
        }()
            
        cell.textLabel?.text = placeholderData[indexPath.row]
        cell.detailTextLabel?.text = "text text text text text text text"
        cell.textLabel?.font = .boldSystemFont(ofSize: 20)
        cell.textLabel?.textColor = .white
        cell.detailTextLabel?.textColor = .white
        cell.backgroundColor = .clear
            
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section Title"
    }
    
}

extension DetailViewController: FSPagerViewDataSource {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 5
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        switch index {
        case 0: cell.imageView?.image = UIImage(named: "a")
        case 1: cell.imageView?.image = UIImage(named: "b")
        case 2: cell.imageView?.image = UIImage(named: "c")
        case 3: cell.imageView?.image = UIImage(named: "d")
        case 4: cell.imageView?.image = UIImage(named: "e")
        default: break
        }
        return cell
    }
    
}


