//
//  PokeCollectionViewCellScreen.swift
//  PokedexProject
//
//  Created by Felipe Domingos on 10/12/22.
//

import UIKit
import SnapKit
import ColorKit
import SDWebImage

class PokeCollectionViewCell: UICollectionViewCell {
    
    static let indentifier:String = "PokeCollectionViewCell"
    
    let homeView = HomeView()
    
    lazy var pokeView: UIView = {
        let img = UIView()
        img.layer.cornerRadius = 10
        img.layer.masksToBounds = true
        return img
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    lazy var pokeImage:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        configContraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addImageAndVIew(data: Register) {
        guard let imgURL = URL(string: data.sprites?.other?.officialArtwork?.front_default ?? "") else { return }
        pokeImage.sd_setImage(with: imgURL) { (image, error, cacheType, url) in
            if let error = error {
                print("Error carregando a imagem: \(error)")
            } else {
                if cacheType == .none {
                    print("A imagem foi baixada da internet")
                } else {
                    print("A imagem foi obtida do cache")
                }
            }
            
            guard let colors = try! image?.dominantColors() else { return }
                guard let palette = ColorPalette(orderedColors: colors, ignoreContrastRatio: true) else {
                    fatalError("Could not create palette")
                }
                self.pokeView.backgroundColor = palette.primary
            }
        }
    
    func addSubview() {
        addSubview(pokeView)
        pokeView.addSubview(pokeImage)
        pokeView.addSubview(nameLabel)
    }
    
    func configContraints() {
        pokeView.snp.makeConstraints{ (make) in
            make.edges.equalToSuperview()
        }
        
        pokeImage.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(pokeView.snp.top).offset(10)
            make.height.equalTo(100)
            make.width.equalTo(80)
        }
        
        nameLabel.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(pokeImage.snp.bottom).offset(10)
        }
    }
}

