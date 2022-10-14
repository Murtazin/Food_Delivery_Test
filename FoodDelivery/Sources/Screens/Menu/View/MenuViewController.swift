//
//  MenuViewController.swift
//  FoodDelivery
//
//  Created by Renat Murtazin on 13.10.2022.
//

import UIKit

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
        
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 295)
        
        tableView.register(DishTableViewCell.self, forCellReuseIdentifier: DishTableViewCell.reuseIdentifier)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DishTableViewCell.reuseIdentifier, for: indexPath) as? DishTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}
