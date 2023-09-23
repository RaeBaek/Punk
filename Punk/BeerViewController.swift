//
//  BeerViewController.swift
//  Punk
//
//  Created by 백래훈 on 2023/09/22.
//

import UIKit
import SnapKit
import Kingfisher

class BeerViewController: UIViewController {

    private lazy var scrollView = {
        let view = UIScrollView()
        view.backgroundColor = .systemMint
        view.minimumZoomScale = 1
        view.maximumZoomScale = 3
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = self
        return view
    }()
    
    private let imageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .systemYellow
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let beerViewModel = BeerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureGesture()
        
//        beerViewModel.request { data in
//            dump(data)
//            guard let link = data.first?.imageURL else { return print("이미지가 없습니다. Sorry") }
//            let url = URL(string: link)
//            self.imageView.kf.setImage(with: url)
//        }
        
        beerViewModel.requestConvertible { data in
            dump(data)
            guard let link = data.first?.imageURL else { return print("이미지가 없습니다. Sorry") }
            let url = URL(string: link)
            self.imageView.kf.setImage(with: url)
        }
        
    }
    
    private func configureHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
    
    private func configureLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        imageView.snp.makeConstraints {
            $0.size.equalTo(scrollView)
        }
    }
    
    private func configureGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapGesture))
        tap.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tap)
        
    }
    
    @objc private func doubleTapGesture() {
        if scrollView.zoomScale == 1 {
            scrollView.setZoomScale(2, animated: true)
        } else {
            scrollView.setZoomScale(1, animated: true)
        }
    }
    

}

extension BeerViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
}
