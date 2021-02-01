//
//  PryanikyPictureCell.swift
//  Pryaniky
//
//  Created by Максим Локтев on 01.02.2021.
//

import UIKit
import Kingfisher


final class PryanikyPictureCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let pictureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .medium)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.textAlignment = .center
        
        return label
    }()
    
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(contentImageView)
        contentView.addSubview(pictureLabel)
        
        makeCostraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupCell(url: String, text: String) {
        contentImageView.kf.setImage(with: URL(string: url))
        pictureLabel.text = text
    }
    
    // MARK: - Layout
    
    private func makeCostraints() {
        contentImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8.0)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(150.0)
        }
        pictureLabel.snp.makeConstraints { make in
            make.top.equalTo(contentImageView.snp.bottom).offset(2.0)
            make.left.right.equalToSuperview().inset(16.0)
            make.bottom.equalToSuperview().offset(2.0)
        }
    }
}
