//
//  HabilitiesTableViewCell.swift
//  PokedexViewCode
//
//  Created by Felipe Domingos on 19/12/22.
//

import UIKit

class HabilitiesTableViewCell: UITableViewCell {

    static let indentifier: String = "HabilitiesTableViewCell"
    
    lazy var habilities: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var statsViewBG: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var statsView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .blue
        return view
    }()
    
    lazy var numberStats: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubView()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func addSubView() {
        contentView.addSubview(habilities)
         contentView.addSubview(statsViewBG)
        statsViewBG.addSubview(statsView)
        statsView.addSubview(numberStats)
    }
    
    public func addDataHabName(data: Stats) {
        numberStats.text = "\(data.base_stat + 50)/300"
        statsView.snp.makeConstraints { make in
            make.width.equalTo(data.base_stat + 80)
        }
        UIView.animate(withDuration: 1.5, delay: 0.6, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
            self.statsView.frame = CGRect(x: self.statsView.frame.origin.x,
                                          y: self.statsView.frame.origin.y,
                                          width: CGFloat(data.base_stat) + 50,
                                          height: self.statsView.frame.size.height)
        }, completion: nil)
    }
    
    func setUpConstraints() {
        habilities.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
        }
        
        statsViewBG.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(habilities.snp.leading).offset(70)
            make.width.equalTo(300)
            make.height.equalTo(20)
        }
        
        statsView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview()
            make.leading.equalTo(statsViewBG.snp.leading)

        }
        
        numberStats.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
