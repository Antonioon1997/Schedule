//
//  ViewController.swift
//  Schedule
//
//  Created by Антон Онищенко on 11.09.2022.
//

import UIKit

class MainScheduleViewController: UIViewController {
    
    
    var data: [String] = ["First", "second", "third"]
    
    var mounth = "Октябрь"
    let navTitle = "Заголовок"
    let tableView = UITableView.init(frame: .zero, style: .plain)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .green
        self.navigationItem.title = navTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.view.addSubview(tableView)
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self
        
//        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .brown
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        self.collectionView.dataSource = self
        updateLayout(with: self.view.bounds.size)

        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (contex) in
              self.updateLayout(with: size)
           }, completion: nil)
    }

    private func updateLayout(with size: CGSize) {

        self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }
    
    
}

extension MainScheduleViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case self.tableView:
            return data.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        var cellContent = cell.defaultContentConfiguration()
        guard indexPath.row == 0 else {
            
            cellContent.text = data[indexPath.row]
            cell.contentConfiguration = cellContent
            collectionView.frame = CGRect(origin: .zero, size: cell.frame.size)

            return cell
        }
        cell.addSubview(collectionView)
        
        return cell
    }
}


class TableViewCell: UITableViewCell {
    
    override func prepareForReuse() {
        
    }
    
}

class CollectionViewCell: UICollectionViewCell {
    
    override class func awakeFromNib() {
        
    }
    
}

extension MainScheduleViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = . red
        
        
        return cell
    }
    
    
    
}
