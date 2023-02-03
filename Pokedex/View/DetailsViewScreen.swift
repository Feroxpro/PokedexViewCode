//
//  DetailsViewScreen.swift
//  PokedexViewCode
//
//  Created by Felipe Domingos on 17/12/22.
//

import UIKit
import ColorKit
import AlamofireImage

class DetailsViewScreen: UIView {
    
    lazy var pokeContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 70
        return view
    }()
    
    lazy var pokeDetailsImg: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var pokeDetailsName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .black
        return label
    }()
    
    lazy var stackViewContainer: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 100
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.backgroundColor = .white
        return stack
    }()
    
    lazy var typeView1: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .black
        return view
    }()
    
    lazy var typeView2: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .black
        return view
    }()
    
    lazy var typeView3: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .black
        return view
    }()
    
    lazy var typeLabel1: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var typeLabel2: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var typeLabel3: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var titleWeightLabel: UILabel = {
        let label = UILabel()
        label.text = "Peso"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var titleHeightLabel: UILabel = {
        let label = UILabel()
        label.text = "Altura"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    lazy var habilities: UILabel = {
        let label = UILabel()
        label.text = "★ Habilidades ★"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(HabilitiesTableViewCell.self, forCellReuseIdentifier: HabilitiesTableViewCell.indentifier)
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.isUserInteractionEnabled = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configSubViews()
        setupContraints()
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addDetailsData(data: Register) {
        pokeDetailsName.text = data.name ?? ""
        weightLabel.text = "\(data.weight ?? 0) KG"
        heightLabel.text = "\(data.height ?? 0) M"
        guard let imgURL = URL(string: data.sprites?.other?.officialArtwork?.front_default ?? "") else { return }
        pokeDetailsImg.sd_setImage(with: imgURL) { (image, error, cacheType, url) in
            if let error = error {
                print("Erro ao carregar imagem: \(error)")
            } else {
                print("Imagem carregada com sucesso.")
            }
            
            guard let colors = try! image?.dominantColors() else { return }
                guard let palette = ColorPalette(orderedColors: colors, ignoreContrastRatio: true) else {
                    fatalError("Could not create palette")
                }
                self.pokeContainer.backgroundColor = palette.primary
            }
    }
    
    func addDataTypes(data: Register) {
            let types = data.types
            var typeNames: [String] = []
            for item in types {
                typeNames.append(item.type.name)
            }
        
            for _ in 0...typeNames.count {
                if typeNames.count == 1 {
                    typeLabel3.text = typeNames[0]
                    typeView2.isHidden = true
                    typeView1.isHidden = true
                }
                
                if typeNames.count == 2 {
                    typeLabel1.text = typeNames[0]
                    typeLabel2.text = typeNames[1]
                    typeView3.isHidden = true
                }
            }
        
            typeView1.backgroundColor = ColorMap.color(for: typeLabel1.text ?? "")
            typeView2.backgroundColor = ColorMap.color(for: typeLabel2.text ?? "")
            typeView3.backgroundColor = ColorMap.color(for: typeLabel3.text ?? "")
            typeLabel1.textColor = ColorMap.colorText(for: typeLabel1.text ?? "")
            typeLabel2.textColor = ColorMap.colorText(for: typeLabel2.text ?? "")
            typeLabel3.textColor = ColorMap.colorText(for: typeLabel3.text ?? "")
    }
    
    func configSubViews() {
        addSubview(pokeContainer)
        pokeContainer.addSubview(pokeDetailsImg)
        addSubview(pokeDetailsName)
        addSubview(stackViewContainer)
        stackViewContainer.addSubview(typeView1)
        stackViewContainer.addSubview(typeView2)
        stackViewContainer.addSubview(typeView3)
        typeView1.addSubview(typeLabel1)
        typeView2.addSubview(typeLabel2)
        typeView3.addSubview(typeLabel3)
        addSubview(titleWeightLabel)
        addSubview(weightLabel)
        addSubview(titleHeightLabel)
        addSubview(heightLabel)
        addSubview(habilities)
        addSubview(tableView)
    }
    
    func setupContraints() {
        pokeContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(-20)
            make.centerX.equalToSuperview()
            make.height.equalTo(400)
            make.width.equalTo(414)
        }
        
        pokeDetailsImg.snp.makeConstraints { make in
            make.top.equalTo(pokeContainer.snp.top).offset(100)
            make.centerX.equalToSuperview()
            make.height.equalTo(280)
            make.width.equalTo(350)
        }
        
        pokeDetailsName.snp.makeConstraints { make in
            make.top.equalTo(pokeContainer.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        stackViewContainer.snp.makeConstraints { make in
            make.top.equalTo(pokeDetailsName.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(28)
        }
        
        typeView1.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.leading.equalToSuperview().offset(90)
            make.width.equalTo(80)
        }
        
        typeView2.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.trailing.equalToSuperview().inset(90)
            make.width.equalTo(80)
        }
        
        typeView3.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
        }
        
        typeLabel1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        typeLabel2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        typeLabel3.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        titleWeightLabel.snp.makeConstraints { make in
            make.top.equalTo(stackViewContainer.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(titleWeightLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(20)
        }
        
        titleHeightLabel.snp.makeConstraints { make in
            make.top.equalTo(stackViewContainer.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(320)
        }
        
        heightLabel.snp.makeConstraints { make in
            make.top.equalTo(titleHeightLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(320)
        }
        
        habilities.snp.makeConstraints { make in
            make.top.equalTo(heightLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(habilities.snp.bottom).offset(5)
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            
        }
    }
}
