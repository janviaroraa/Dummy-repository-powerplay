//
//  EnterCodeCell.swift
//  Powerplay
//
//  Created by Powerplay on 02/02/23.
//

import UIKit
import SnapKit

class EnterCodeCell: UITableViewCell {
    lazy var lbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Have you get Invite message from Powerplay?"
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var lbl2: UILabel = {
        let lbl = UILabel()
        lbl.text = "Enter Invite code - which you got with Invite link"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 16.0)
        lbl.textColor = .white
        return lbl
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Enter Code", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 4
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraints()
        addSubview(lbl1)
        addSubview(lbl2)
        addSubview(btn)
    }
    
    private func configureConstraints() {
        lbl1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(111)
            make.bottom.equalToSuperview().offset(26)
        }
        
        lbl2.snp.makeConstraints { make in
            make.top.equalTo(lbl1.snp.bottom).offset(4)
            make.leading.equalTo(lbl1.snp.leading)
            make.trailing.equalTo(lbl1.snp.trailing)
            make.bottom.equalToSuperview().offset(6)
        }
        
        btn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(lbl1.snp.trailing).offset(17)
            make.trailing.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(8)
        }
    }
}
