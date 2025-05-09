//
//  MainTabTableManager.swift
//  week02
//
//  Created by 조영서 on 5/3/25.
//

import UIKit

final class MainTabTableManager: NSObject {
    var selectedTabIndex: Int = 0
    weak var scrollDelegate: UIScrollViewDelegate?
}

extension MainTabTableManager: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch selectedTabIndex {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {
                return UITableViewCell()
            }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BoxOfficeContentCell.identifier, for: indexPath) as? BoxOfficeContentCell else {
                return UITableViewCell()
            }
            return cell
        default:
            let cell = UITableViewCell()
            cell.backgroundColor = .black
            let label = UILabel()
            label.text = "준비 중~"
            label.textColor = .white
            label.font = UIFont(name: "Pretendard-Regular", size: 14)
            label.translatesAutoresizingMaskIntoConstraints = false
            cell.contentView.addSubview(label)
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
            ])
            return cell
        }
    }


    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollDelegate?.scrollViewDidScroll?(scrollView)
    }
}
