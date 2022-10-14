//
//  MenuTableViewHeaderView.swift
//  FoodDelivery
//
//  Created by Renat Murtazin on 13.10.2022.
//

import UIKit

final class MenuHeaderView: UIView {
    
    // MARK: - Private properties
    
    private var banners: [UIImage] = [
        #imageLiteral(resourceName: "banner-icon"),
        #imageLiteral(resourceName: "banner-icon")
    ]
    
    private var categories: [String] = [
        "Пицца",
        "Комбо",
        "Десерты",
        "Напитки"
    ]
    
    // MARK: - UI
    
    private lazy var cityTitleButton: UIButton = {
        let cityTitleButton = UIButton()
        let image = #imageLiteral(resourceName: "arrow-icon")
        cityTitleButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        cityTitleButton.setTitle("Москва", for: .normal)
        cityTitleButton.setImage(image, for: .normal)
        cityTitleButton.setTitleColor(.label, for: .normal)
        cityTitleButton.semanticContentAttribute = .forceRightToLeft
        cityTitleButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        return cityTitleButton
    }()
    
    private lazy var bannersCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray6
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    private lazy var categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray6
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
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
}

// MARK: - Private functions

private extension MenuHeaderView {
    
    func setupUI() {
        
        backgroundColor = .systemGray6
        
        addSubview(cityTitleButton)
        addSubview(bannersCollectionView)
        addSubview(categoriesCollectionView)
        
        cityTitleButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(54)
            $0.leading.equalToSuperview().inset(16)
        }
        
        bannersCollectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.reuseIdentifier)
        
        bannersCollectionView.snp.makeConstraints {
            $0.top.equalTo(cityTitleButton.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(112)
        }
        
        categoriesCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier)
        
        categoriesCollectionView.snp.makeConstraints {
            $0.top.equalTo(bannersCollectionView.snp.bottom).offset(24)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(32)
        }
    }
}

// MARK: - UICollectionViewDataSource

extension MenuHeaderView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == bannersCollectionView ? 2 : 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case bannersCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.reuseIdentifier, for: indexPath) as? BannerCollectionViewCell else {
                return UICollectionViewCell()
            }
            let image = banners[indexPath.row]
            cell.configure(image: image)
            return cell
        case categoriesCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier, for: indexPath) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            let title = categories[indexPath.row]
            cell.configure(title: title)
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case bannersCollectionView:
            return .init(width: 300, height: 112)
        case categoriesCollectionView:
            return .init(width: 88, height: 32)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return collectionView == categoriesCollectionView ? .init(top: 0, left: 16, bottom: 0, right: 16) : .init(top: 0, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MenuHeaderView: UICollectionViewDelegateFlowLayout {
    
}
