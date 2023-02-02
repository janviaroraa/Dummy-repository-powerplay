//
//  NewTable.swift
//  Powerplay
//
//  Created by Powerplay on 02/02/23.
//

import UIKit
import SnapKit

class NewTable: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let enterCodeCellId = "enterCodeCellId"
    let exploreCellId = "exploreCellId"
    
    let tableView: UITableView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    let backgroundImageview: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "bg")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: imageCellId)
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: albumsCellId)
        
        view.addSubview(backgroundImageview)
        view.addSubview(collectionView)
        
        backgroundImageview.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)
        collectionView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)
        
        view.setCellShadow()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return albumsArray.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: albumsCellId, for: indexPath) as! AlbumCell
            cell.albums = albumsArray[indexPath.item]
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageCellId, for: indexPath) as! ImageCell
        cell.images = imagesArray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: (view.frame.width/3) - 16, height: 100)
        }
        return CGSize(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        }
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
}

//MARK: - Image CV Cell
class ImageCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var images: [String]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let cellId = "cellId"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ItemsCell.self, forCellWithReuseIdentifier: cellId)
        addSubview(collectionView)
        collectionView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)
        collectionView.showsHorizontalScrollIndicator = false
        setCellShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ItemsCell
        if let imageName = images?[indexPath.item] {
            cell.imageView.image = UIImage(named: imageName)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    //MARK: - items CV cell
    
    private class ItemsCell: UICollectionViewCell {
        
        let imageView: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFill
            iv.clipsToBounds = false
            iv.layer.cornerRadius = 15          // not working ??
            return iv
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setup() {
            addSubview(imageView)
            imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)
        }
    }
}

//MARK: - Album CV Cell
class AlbumCell: UICollectionViewCell {
    
    var albums: String? {
        didSet {
            if let imageName = albums {
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = false
        iv.layer.cornerRadius = 15          // not working ??
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        imageView.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(imageView)
        imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0)
    }
}

