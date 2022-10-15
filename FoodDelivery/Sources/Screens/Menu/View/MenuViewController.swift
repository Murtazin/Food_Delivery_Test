//
//  MenuViewController.swift
//  FoodDelivery
//
//  Created by Renat Murtazin on 13.10.2022.
//

import UIKit
import SnapKit

final class MenuViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 180
        return tableView
    }()
    
    private lazy var headerView = MenuHeaderView()
    
    /// На самом деле я так не делаю (форс анрап)
    private var headerViewHeight: CGFloat!
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
}

// MARK: - Private functions

private extension MenuViewController {
    
    func setupUI() {
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(headerView)
        view.addSubview(tableView)
        
        headerViewHeight = 295
        
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(headerViewHeight)
        }
        
        tableView.register(DishTableViewCell.self, forCellReuseIdentifier: DishTableViewCell.reuseIdentifier)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    func animateHeader() {
        headerViewHeight = 295
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }) { [weak self] _ in
            self?.remakeConstraints()
        }
    }
    
    func remakeConstraints() {
        headerView.snp.remakeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(headerViewHeight)
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DishTableViewCell.reuseIdentifier, for: indexPath) as? DishTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

// MARK: - UIScrollViewDelegate

extension MenuViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            headerViewHeight += abs(scrollView.contentOffset.y)
            DispatchQueue.main.async {
                self.remakeConstraints()
            }
        } else if scrollView.contentOffset.y > 0 && headerViewHeight >= 220 {
            headerViewHeight -= scrollView.contentOffset.y / 100
            DispatchQueue.main.async {
                self.remakeConstraints()
            }
            if headerViewHeight < 220 {
                headerViewHeight = 220
                DispatchQueue.main.async {
                    self.remakeConstraints()
                }
            }
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if headerViewHeight > 295 {
            animateHeader()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if headerViewHeight > 295 {
            animateHeader()
        }
    }
}
