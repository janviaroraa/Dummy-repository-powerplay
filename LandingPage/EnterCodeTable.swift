//
//  EnterCodeTable.swift
//  Powerplay
//
//  Created by Powerplay on 02/02/23.
//

import UIKit
import SnapKit

class EnterCodeTable: UITableViewController {
    let enterCodeCellId = "enterCodeCellId"
    let exploreCellId = "exploreCellId"
    
    lazy var tbl1: UITableView = {
        let tbl = UITableView()
        let color = UIColor(hexValue: "#071424")
        tbl.backgroundColor = color
        return tbl
    }()
    
    lazy var tbl2: UITableView = {
        let tbl = UITableView()
        tbl.backgroundColor = .white
        tbl.addCornerRadius(10.0)
        return tbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableview1()
        configureTableview2()
    }
    
    private func configureTableview1() {
        view.addSubview(tbl)
        tbl1.delegate = self
        tbl1.dataSource = self
        tbl1.register(EnterCodeCell.self, forCellReuseIdentifier: enterCodeCellId)
        tbl2.register(ExploreCell.self, forCellReuseIdentifier: exploreCellId)
        
        tbl1.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(94)
            make.height.equalToSuperview().offset(48)
        }
    }
    
    private func configureTableview2() {
        view.addSubview(tbl)
        tbl2.delegate = self
        tbl2.dataSource = self
        tbl2.register(ExploreCell.self, forCellReuseIdentifier: "cell")
        
        tbl2.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(tbl1.snp.bottom).offset(26)
            make.height.equalToSuperview().offset(84)
        }
    }
}


extension EnterCodeTable: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tbl1 {
            let cell = tableView.dequeueReusableCell(withReuseIdentifier: enterCodeCellId, for: indexPath) as! EnterCodeCell
            return cell
        }
        if tableView == self.tbl2 {
            let cell = tableView.dequeueReusableCell(withReuseIdentifier: enterCodeCellId, for: indexPath) as! ExploreCell
            return cell
        }
//        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tbl1.deselectRow(at: indexPath, animated: true)
        tbl2.deselectRow(at: indexPath, animated: true)
    }
}
