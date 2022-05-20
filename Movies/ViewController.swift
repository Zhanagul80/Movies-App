//
//  ViewController.swift
//  Movies
//
//  Created by Zhanagul Tynysbek on 17.04.2022.
//

import UIKit

class ViewController: UIViewController {

    let movies: [UIImage] = [#imageLiteral(resourceName: "ironMan"), #imageLiteral(resourceName: "spider"), #imageLiteral(resourceName: "tenet"), #imageLiteral(resourceName: "avengers")]
    let books: [UIImage] = [#imageLiteral(resourceName: "book2"), #imageLiteral(resourceName: "book4"), #imageLiteral(resourceName: "book3"), #imageLiteral(resourceName: "book1")]
    let musics: [UIImage] = [#imageLiteral(resourceName: "music2"), #imageLiteral(resourceName: "music3"), #imageLiteral(resourceName: "music4"), #imageLiteral(resourceName: "music1")]
    
    let rows: [[UIImage]] = [
        [#imageLiteral(resourceName: "ironMan"), #imageLiteral(resourceName: "spider"), #imageLiteral(resourceName: "tenet"), #imageLiteral(resourceName: "avengers")],
        [#imageLiteral(resourceName: "music2"), #imageLiteral(resourceName: "music3"), #imageLiteral(resourceName: "music4"), #imageLiteral(resourceName: "music1")],
        [#imageLiteral(resourceName: "book2"), #imageLiteral(resourceName: "book4"), #imageLiteral(resourceName: "book3"), #imageLiteral(resourceName: "book1")]
    ]
    
    @IBOutlet private weak var moviesCollectionView: UICollectionView!
    @IBOutlet private weak var musicCollectionView: UICollectionView!
    @IBOutlet private weak var booksCollectionView: UICollectionView!
    
    var selectedIndex: (section: Int, rows: Int)!

    override func viewDidLoad() {
        super.viewDidLoad()
        moviesCollectionView.dataSource = self
        musicCollectionView.dataSource = self
        booksCollectionView.dataSource = self
        moviesCollectionView.delegate = self
        musicCollectionView.delegate = self
        booksCollectionView.delegate = self
        
        let nib = UINib(nibName: "ItemCell", bundle: Bundle(for: ItemCell.self))
        moviesCollectionView.register(nib, forCellWithReuseIdentifier: "ItemCell")
        musicCollectionView.register(nib, forCellWithReuseIdentifier: "ItemCell")
        booksCollectionView.register(nib, forCellWithReuseIdentifier: "ItemCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailViewController {
            detailVC.image = rows[selectedIndex.section][selectedIndex.rows]
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.layer.borderWidth = 3
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.cornerRadius = 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section: Int
        
        if collectionView == moviesCollectionView {
            section = 0
        } else if collectionView == musicCollectionView {
            section = 1
        } else {
            section = 2
        }

        selectedIndex = (section, indexPath.row)
        performSegue(withIdentifier: "showDetail", sender: self)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let rows: Int
        if collectionView == moviesCollectionView {
            rows = movies.count
        } else if collectionView == musicCollectionView {
            rows = musics.count
        } else {
            rows = books.count
        }
        return rows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        if collectionView == moviesCollectionView {
            cell.configure(with: movies[indexPath.row])
        } else if collectionView == musicCollectionView {
            cell.configure(with: musics[indexPath.row])
        } else if collectionView == booksCollectionView {
            cell.configure(with: books[indexPath.row])
        }
        
        return cell
    }
}

