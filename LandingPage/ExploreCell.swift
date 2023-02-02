//
//  ExploreCell.swift
//  Powerplay
//
//  Created by Powerplay on 02/02/23.
//

import UIKit
import SnapKit

class ExploreCell: UITableViewCell {
    lazy var img: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = . scaleAspectFill
        img.layer.cornerRadius = 4
        img.clipsToBounds = true
        return img
    }()
    
    lazy var lbl1: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Sample Project"
        lbl.font = UIFont.boldSystemFont(ofSize: 16.0)
        lbl.textColor = .black
        lbl.font.withSize(14.0)
        return lbl
    }()
    
    lazy var lbl2: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "My Organisation"
        lbl.textColor = .black
        lbl.font.withSize(12.0)
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
        addSubview(img)
        addSubview(lbl1)
        addSubview(lbl2)
        addSubview(btn)
        configureConstraints()
    }
    
    private func configureConstraints() {
        img.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(12)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(242)
        }
        
        lbl1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22)
            make.leading.equalTo(img.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(138)
            make.bottom.equalToSuperview().offset(42)
        }
        
        lbl2.snp.makeConstraints { make in
            make.top.equalTo(lbl1.snp.bottom).offset(4)
            make.leading.equalTo(lbl1.snp.leading)
            make.trailing.equalTo(lbl1.snp.trailing)
            make.bottom.equalToSuperview().offset(22)
        }
        
        btn.snp.makeConstraints { make in
            make.leading.equalTo(lbl1.snp.trailing).offset(52)
            make.top.bottom.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().offset(12)
        }
    }
}
