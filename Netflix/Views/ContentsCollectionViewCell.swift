//
//  ContentsCollectionViewCell.swift
//  Netflix
//
//  Created by Apple on 27/09/23.
//

import UIKit
import SDWebImage

class ContentsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ContentsCollectionViewCell"
    
    var posterImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
        posterImageView.clipsToBounds = true
    }
    
    public func configurePosterImage(with model : String){
        
        let myStringURL = String(describing: "https://image.tmdb.org/t/p/w500/" + model)
        
        guard let url = URL(string: myStringURL) else {
            return
        }
        posterImageView.sd_setImage(with: url, completed: nil)
    }
}
