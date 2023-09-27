//
//  CollectionViewTableViewCell.swift
//  Netflix
//
//  Created by Apple on 25/09/23.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    
    static let identifier = "CollectionViewTableViewCell"
    private var contentData : [Contents] = [Contents]()
    
    
    //CollectionView Creation.
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ContentsCollectionViewCell.self, forCellWithReuseIdentifier: ContentsCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //TableCell Properties
        contentView.backgroundColor = .systemYellow
        
        //Add Subviews
        contentView.addSubview(collectionView)
        
        //CollectionView Properties
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureContentCells(with data : [Contents]){
        self.contentData = data
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

extension CollectionViewTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentsCollectionViewCell.identifier, for: indexPath) as? ContentsCollectionViewCell else {
            return UICollectionViewCell()
        }
        guard let path = contentData[indexPath.row].poster_path else{
            return UICollectionViewCell()
        }
        cell.configurePosterImage(with: path)
        return cell
    }
}
