//
//  LoadingIndicator.swift
//  Pryaniky
//
//  Created by Максим Локтев on 01.02.2021.
//

import Lottie

final class LoadingIndicator: UIView {
    
    // MARK: - Properties
    
    private let animationView: AnimationView = {
        let view = AnimationView()
        view.loopMode = LottieLoopMode.loop
        view.animation = Animation.named("loading")
        
        return view
    }()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .clear
        addSubview(animationView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        animationView.frame = bounds
    }
    
    func startAnimation() {
        animationView.play()
    }
    
    func stopAnimation() {
        animationView.stop()
    }
}

