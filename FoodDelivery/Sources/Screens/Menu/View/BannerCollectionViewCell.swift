//
//  BannerCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Renat Murtazin on 14.10.2022.
//

import UIKit

final class BannerCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "BannerCollectionViewCell"
    
    // MARK: - UI
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemGray6
        return imageView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupUI()
    }
    
    // MARK: - Internal functions
    
    internal func configure(image: UIImage) {
        imageView.image = image
    }
}

// MARK: - Private functions

private extension BannerCollectionViewCell {
    
    func setupUI() {
        
        addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(112)
            $0.width.equalTo(300)
        }
    }
}
