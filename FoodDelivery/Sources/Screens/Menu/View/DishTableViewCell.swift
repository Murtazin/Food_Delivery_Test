//
//  DishTableViewCell.swift
//  FoodDelivery
//
//  Created by Renat Murtazin on 13.10.2022.
//

import UIKit
import SnapKit

final class DishTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "DishTableViewCell"
    
    // MARK: - UI
    
    private lazy var dishImageView: UIImageView = {
        let dishImageView = UIImageView()
        dishImageView.contentMode = .scaleAspectFit
        dishImageView.image = #imageLiteral(resourceName: "pizza-icon")
        return dishImageView
    }()
    
    private lazy var dishTitleLabel: UILabel = {
        let dishTitleLabel = UILabel()
        dishTitleLabel.numberOfLines = 1
        dishTitleLabel.textColor = .label
        dishTitleLabel.font = UIFont.systemFont(ofSize: 17)
        dishTitleLabel.text = "Ветчина и грибы"
        return dishTitleLabel
    }()
    
    private lazy var dishDescriptionLabel: UILabel = {
        let dishDescriptionLabel = UILabel()
        dishDescriptionLabel.numberOfLines = 0
        dishDescriptionLabel.textColor = .systemGray
        dishDescriptionLabel.font = UIFont.systemFont(ofSize: 13)
        dishDescriptionLabel.text = "Ветчина, шампиньоны,\nувеличинная порция\nмоцареллы, томатный соус"
        return dishDescriptionLabel
    }()
    
    private lazy var dishPriceButton: UIButton = {
        let dishPriceButton = UIButton()
        dishPriceButton.layer.cornerRadius = 6
        dishPriceButton.layer.borderWidth = 1.0
        dishPriceButton.layer.borderColor = UIColor.systemPink.cgColor
        dishPriceButton.setTitleColor(.systemPink, for: .normal)
        dishPriceButton.setTitle("От 345 р", for: .normal)
        dishPriceButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        return dishPriceButton
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupUI()
    }
}

// MARK: - Private functions

private extension DishTableViewCell {
    
    func setupUI() {
        
        contentView.isUserInteractionEnabled = true
        
        contentView.addSubview(dishImageView)
        contentView.addSubview(dishTitleLabel)
        contentView.addSubview(dishDescriptionLabel)
        contentView.addSubview(dishPriceButton)
        
        dishImageView.snp.makeConstraints {
            $0.top.equalTo(contentView).inset(24)
            $0.leading.equalTo(contentView).inset(16)
            $0.height.width.equalTo(132)
        }
        
        dishTitleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView).inset(32)
            $0.trailing.equalTo(contentView).inset(65)
        }
        
        dishDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(contentView).inset(60)
            $0.trailing.equalTo(contentView).inset(24)
        }
        
        dishPriceButton.snp.makeConstraints {
            $0.top.equalTo(dishDescriptionLabel).inset(64)
            $0.trailing.equalTo(contentView).inset(24)
            $0.height.equalTo(32)
            $0.width.equalTo(87)
        }
    }
}
