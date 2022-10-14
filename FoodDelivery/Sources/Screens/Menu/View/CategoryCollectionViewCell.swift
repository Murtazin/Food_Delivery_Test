//
//  CategoryCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Renat Murtazin on 14.10.2022.
//

import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CategoryCollectionViewCell"
    
    // MARK: - Private properties
    
    private var categoryButtons: [UIButton] = []
    private var selectedCategoryButton: UIButton?
    
    // MARK: - UI
    
    private lazy var categoryButton: UIButton = {
        let categoryButton = UIButton()
        categoryButton.layer.cornerRadius = 15
        categoryButton.layer.borderColor = UIColor.systemPink.cgColor
        categoryButton.layer.borderWidth = 1.0
        categoryButton.setTitleColor(.systemPink, for: .normal)
        categoryButton.setTitleColor(.systemPurple, for: .selected)
        categoryButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        categoryButton.addTarget(self, action: #selector(categoryButtonHandler), for: .touchUpInside)
        return categoryButton
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
    
    internal func configure(title: String) {
        categoryButton.setTitle(title, for: .normal)
        categoryButtons.append(categoryButton)
    }
}

// MARK: - Private functions

private extension CategoryCollectionViewCell {
    
    func setupUI() {
        
        addSubview(categoryButton)
        
        categoryButton.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.height.equalTo(contentView)
            $0.width.equalTo(88)
        }
    }
    
    // MARK: - OBJC functions
    
    @objc func categoryButtonHandler(sender: UIButton) {
    }
}
