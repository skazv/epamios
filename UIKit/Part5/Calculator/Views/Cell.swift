//
//  Cell.swift
//  Calculator
//
//  Created by Suren Kazaryan on 02.07.25.
//
import UIKit

class GymClassCell: UITableViewCell {
    static let identifier = "GymClassCell"

    let nameLabel = UILabel()
    let timeLabel = UILabel()
    let durationLabel = UILabel()
    let trainerLabel = UILabel()
    let heartImageView = UIImageView()
    let trainerImageView = UIImageView()
    let registerButton = UIButton(type: .system)

    var onToggleRegistration: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        heartImageView.layer.cornerRadius = 20
        heartImageView.contentMode = .scaleAspectFill
        
        trainerImageView.translatesAutoresizingMaskIntoConstraints = false
        trainerImageView.layer.cornerRadius = 12
        trainerImageView.clipsToBounds = true
        trainerImageView.contentMode = .scaleAspectFill

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        trainerLabel.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubviews(views: [
            heartImageView,
            trainerImageView,
            nameLabel,
            timeLabel,
            durationLabel,
            trainerLabel,
            registerButton
        ])
        
        timeLabel.font = .systemFont(ofSize: 16, weight: .bold)
        timeLabel.textColor = .systemPink
        timeLabel.textAlignment = .center
        
        durationLabel.font = .systemFont(ofSize: 8, weight: .light)
        durationLabel.textColor = .systemGray6
        durationLabel.textAlignment = .center
        
        
        durationLabel.font = .systemFont(ofSize: 14, weight: .medium)
        durationLabel.textColor = .label

        registerButton.addTarget(self, action: #selector(toggleRegister), for: .touchUpInside)

        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            timeLabel.bottomAnchor.constraint(equalTo: durationLabel.topAnchor, constant: -6),
            timeLabel.widthAnchor.constraint(equalToConstant: 80),
            timeLabel.heightAnchor.constraint(equalToConstant: 20),

            durationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            durationLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            durationLabel.widthAnchor.constraint(equalToConstant: 80),
            durationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            heartImageView.leadingAnchor.constraint(equalTo: durationLabel.trailingAnchor, constant: 15),
            heartImageView.bottomAnchor.constraint(equalTo: trainerImageView.topAnchor, constant: -5),
            heartImageView.widthAnchor.constraint(equalToConstant: 15),
            heartImageView.heightAnchor.constraint(equalToConstant: 15),
            
            trainerImageView.leadingAnchor.constraint(equalTo: durationLabel.trailingAnchor, constant: 10),
            trainerImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
            trainerImageView.widthAnchor.constraint(equalToConstant: 25),
            trainerImageView.heightAnchor.constraint(equalToConstant: 25),
            
            trainerLabel.leadingAnchor.constraint(equalTo: trainerImageView.trailingAnchor, constant: 5),
            trainerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),

            nameLabel.leadingAnchor.constraint(equalTo: trainerImageView.trailingAnchor, constant: 5),
            nameLabel.bottomAnchor.constraint(equalTo: trainerLabel.topAnchor, constant: -5),


            registerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            registerButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(with gymClass: GymClass) {
        nameLabel.text = gymClass.name
        timeLabel.text = "\(gymClass.time)"
        durationLabel.text = "\(gymClass.duration)"
        trainerLabel.text = "\(gymClass.trainer.fullName)"
        heartImageView.image = UIImage(systemName: "heart")
        trainerImageView.image = gymClass.trainer.photo ?? UIImage(systemName: "person")

        let buttonTitle = gymClass.isRegistered ? "✕" : "+"
        registerButton.setTitle(buttonTitle, for: .normal)
    }

    @objc private func toggleRegister() {
        onToggleRegistration?()
    }
}
