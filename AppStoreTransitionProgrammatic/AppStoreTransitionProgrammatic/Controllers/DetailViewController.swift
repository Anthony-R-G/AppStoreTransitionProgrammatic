//
//  DetailViewController.swift
//  AppStoreTransitionProgrammatic
//
//  Created by Anthony Gonzalez on 8/14/20.
//  Copyright © 2020 Antnee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    private lazy var shadowView: ShadowView = {
        let sv = ShadowView()
        sv.backgroundColor = .clear
        return sv
    }()
    
    private lazy var maskView: UIView = {
        let sv = UIView()
        sv.backgroundColor = .clear
        return sv
    }()
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .clear
        sv.contentInsetAdjustmentBehavior = .never
        return sv
    }()
    
    private lazy var contentView: UIView = {
        return UIView()
    }()
    
    private lazy var commonView: CommonView = {
        let cv = CommonView()
        cv.clipsToBounds = true
        return cv
    }()
    
    private lazy var bodyView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        let text = """
I am not to blame for that crown upon your head, Maggie! Giving grape juice to the juiceless. Now you pressure me, as if I might suffer the same in my unhinged soul. Maggie, there is no mercy for the juiceless. I do not even hear them. For you, Maggie, I answer only as to settle accounts and, in filling that final fraternal debit, I release you forever to your juiceless existence. All I hear now is that clockwork meowing, of yolk in those stomachs of four-headed dragons more full than mine! The Candy Mountains I must climb! The power I must grow! I do not know you, dear Maggie. Had you once who ever loved me, that Maggie would have cracked his shrinking egg open and let me feast on the yolk before begging for my share. There is much eating to be done. I must play catch up with the Sun and Moon. Do not pester me further, Maggie. Every word I speak is an grape I spill.\n\n

I am not to blame for that crown upon your head, Maggie! Giving grape juice to the juiceless. Now you pressure me, as if I might suffer the same in my unhinged soul. Maggie, there is no mercy for the juiceless. I do not even hear them. For you, Maggie, I answer only as to settle accounts and, in filling that final fraternal debit, I release you forever to your juiceless existence. All I hear now is that clockwork meowing, of yolk in those stomachs of four-headed dragons more full than mine! The Candy Mountains I must climb! The power I must grow! I do not know you, dear Maggie. Had you once who ever loved me, that Maggie would have cracked his shrinking egg open and let me feast on the yolk before begging for my share. There is much eating to be done. I must play catch up with the Sun and Moon. Do not pester me further, Maggie. Every word I speak is an grape I spill.\n\n

I am not to blame for that crown upon your head, Maggie! Giving grape juice to the juiceless. Now you pressure me, as if I might suffer the same in my unhinged soul. Maggie, there is no mercy for the juiceless. I do not even hear them. For you, Maggie, I answer only as to settle accounts and, in filling that final fraternal debit, I release you forever to your juiceless existence. All I hear now is that clockwork meowing, of yolk in those stomachs of four-headed dragons more full than mine! The Candy Mountains I must climb! The power I must grow! I do not know you, dear Maggie. Had you once who ever loved me, that Maggie would have cracked his shrinking egg open and let me feast on the yolk before begging for my share. There is much eating to be done. I must play catch up with the Sun and Moon. Do not pester me further, Maggie. Every word I speak is an grape I spill.\n\n

I am not to blame for that crown upon your head, Maggie! Giving grape juice to the juiceless. Now you pressure me, as if I might suffer the same in my unhinged soul. Maggie, there is no mercy for the juiceless. I do not even hear them. For you, Maggie, I answer only as to settle accounts and, in filling that final fraternal debit, I release you forever to your juiceless existence. All I hear now is that clockwork meowing, of yolk in those stomachs of four-headed dragons more full than mine! The Candy Mountains I must climb! The power I must grow! I do not know you, dear Maggie. Had you once who ever loved me, that Maggie would have cracked his shrinking egg open and let me feast on the yolk before begging for my share. There is much eating to be done. I must play catch up with the Sun and Moon. Do not pester me further, Maggie. Every word I speak is an grape I spill.\n\n
"""
        label.numberOfLines = 0
        label.text = text + text + text + text
        label.textColor = .black
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "close"), for: .normal)
        btn.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //MARK: -- Methods
    
    @objc private func closeButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    func asCard(_ value: Bool) {
        if value {
            // Round the corners
            self.maskView.layer.cornerRadius = 10
        } else {
            // Round the corners
            self.maskView.layer.cornerRadius = 0
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize.height   = 2000
        scrollView.scrollIndicatorInsets = view.safeAreaInsets
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: view.safeAreaInsets.bottom, right: 0)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        addSubviews()
        setConstraints()
        view.backgroundColor = .white
    }
}

//MARK: -- Add Subviews & Constraints

extension DetailViewController {
    func addSubviews() {
        view.addSubview(shadowView)
        view.addSubview(maskView)
        maskView.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        contentView.addSubview(bodyView)
        contentView.addSubview(commonView)
        view.addSubview(closeButton)
        
        bodyView.addSubview(textLabel)
    }
    
    func setConstraints() {
        setShadowViewConstraints()
        setMaskViewConstraints()
        
        setScrollViewConstraints()
        setContentViewConstraints()
        
        setCommonViewConstraints()
        setBodyViewConstraints()
        setBodyTextConstraints()
        
        setCloseButtonConstraints()
    }
    
    func setShadowViewConstraints() {
        shadowView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func setMaskViewConstraints() {
        maskView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
    
    func setScrollViewConstraints() {
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(maskView)
        }
    }
    
    func setContentViewConstraints() {
        contentView.snp.makeConstraints { (make) in
            make.edges.equalTo(scrollView)
        }
    }
    
    func setCommonViewConstraints() {
        commonView.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView)
            make.left.right.equalTo(view)
            make.height.equalTo(500)
        }
    }
    
    func setBodyViewConstraints() {
        bodyView.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(view)
            make.top.equalTo(commonView.snp.bottom)
            make.bottom.greaterThanOrEqualTo(scrollView)
        }
    }
    
    func setBodyTextConstraints() {
        textLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(bodyView).inset(16)
            
        }
    }
    
    func setCloseButtonConstraints() {
        closeButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(44)
        }
    }
}
