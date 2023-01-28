//
//  ViewController.swift
//  Magic 8 Ball (Programmatically)
//
//  Created by Eduard Tokarev on 28.01.2023.
//

import UIKit

final class ViewController: UIViewController {
    private let ballArray = [ #imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball5"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball4")]
    
    private let stackView = UIStackView()
    private let viewForLabel = UIView()
    private let viewForButton = UIView()
    
    private let label = UILabel()
    private let imageView = UIImageView()
    private let buttonAsk = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyStyle()
        applyLayout()
        actionButton()
    }
    
    func actionButton() {
        buttonAsk.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        setImageForImageView()
    }
    
    func setImageForImageView() {
        imageView.image = ballArray.randomElement()
    }
    
    func applyStyle() {
        view.backgroundColor = .systemCyan
        
        setImageForImageView()
        imageView.contentMode = .scaleAspectFit
        
        label.text = "Ask Me Anything"
        label.font = .systemFont(ofSize: 40)
        label.textColor = .white
        label.contentMode = .scaleAspectFit
        
        buttonAsk.setTitle("Ask", for: .normal)
        buttonAsk.backgroundColor = .white
        buttonAsk.titleLabel?.font = .systemFont(ofSize: 40)
        buttonAsk.setTitleColor(.systemCyan, for: .normal)
    }
    
    func applyLayout() {
        [stackView, imageView].forEach { item in
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)
        }
        
        arrangeStackView(
            stackView,
            subviews: [viewForLabel, viewForButton]
        )
        
        viewForLabel.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        viewForButton.addSubview(buttonAsk)
        buttonAsk.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            label.centerYAnchor.constraint(equalTo: viewForLabel.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: viewForLabel.centerXAnchor),
            
            buttonAsk.heightAnchor.constraint(equalToConstant: 80),
            buttonAsk.widthAnchor.constraint(equalToConstant: 115),
            buttonAsk.centerXAnchor.constraint(equalTo: viewForButton.centerXAnchor),
            buttonAsk.centerYAnchor.constraint(equalTo: viewForButton.centerYAnchor)
        ])
        
        func arrangeStackView (
            _ stackView: UIStackView,
            subviews: [UIView],
            axis: NSLayoutConstraint.Axis = .vertical,
            distribution: UIStackView.Distribution = .fillEqually,
            alignment: UIStackView.Alignment = .fill
        ){
            stackView.axis = axis
            stackView.distribution = distribution
            stackView.alignment = alignment
            
            subviews.forEach { item in
                item.translatesAutoresizingMaskIntoConstraints = false
                stackView.addArrangedSubview(item)
            }
        }
    }
}
