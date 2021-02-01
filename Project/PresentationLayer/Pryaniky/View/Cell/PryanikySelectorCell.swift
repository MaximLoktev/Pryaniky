//
//  PryanikySelectorCell.swift
//  Pryaniky
//
//  Created by Максим Локтев on 01.02.2021.
//

import UIKit

final class PryanikySelectorCell: UITableViewCell {
    
    // MARK: - Properties
    
    private var segmentVariant = [Variant]()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .medium)
        label.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.textAlignment = .center
        label.text = "Выберите вариант"
        
        return label
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .selected)
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
        segment.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        segment.selectedSegmentTintColor = .white
        
        return segment
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(segmentedControl)
        
        segmentedControl.addTarget(self, action: #selector(tapSegment(_:)), for: .valueChanged)
        
        makeCostraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupCell(selector: Int, variants: [Variant]) {
        segmentVariant = variants
        
        for variant in variants {
            segmentedControl.insertSegment(withTitle: variant.text, at: variant.id, animated: true)
        }
        
        let indexSelector = selector - 1
        segmentedControl.selectedSegmentIndex = indexSelector
        
        setupTitle(index: indexSelector)
    }
    
    private func setupTitle(index: Int) {
        let text = segmentVariant[index].text
        let id = segmentVariant[index].id
        
        titleLabel.text = "\(text). id: \(id)"
    }
    
    // MARK: - Actions
    
    @objc
    func tapSegment(_ segment: UISegmentedControl) {
        let index = segment.selectedSegmentIndex
        setupTitle(index: index)
    }
    
    // MARK: - Layout
    
    private func makeCostraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8.0)
            make.left.right.equalToSuperview().inset(16.0)
        }
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8.0)
            make.centerX.equalToSuperview()
            make.height.equalTo(44.0)
        }
    }
}
