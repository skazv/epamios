//
//  ViewController.swift
//  Calculator
//
//  Created by Suren Kazaryan on 06.06.25.
//

import UIKit

class GymViewController: UIViewController {

    private var tableView = UITableView()

    private var gymClassesByDay: [String: [GymClass]] = [:]
    private var days: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gym Classes"
        view.backgroundColor = .white
        setupData()
        setupTableView()
    }

    private func setupData() {
        let trainer = Trainer(fullName: "Suren Kazaryan", photo: UIImage(named: "ssquar"))
        let classes = [
            GymClass(name: "Stretching", day: "Friday 21 Feb 2025", time: "10:00", duration: "60m", trainer: trainer, isRegistered: false),
            GymClass(name: "MMA", day: "Saturday 22 Feb 2025", time: "12:00", duration: "45m", trainer: trainer, isRegistered: false),
            GymClass(name: "MMA", day: "Saturday 22 Feb 2025", time: "14:00", duration: "45m", trainer: trainer, isRegistered: false),
            GymClass(name: "Yoga", day: "Monday 24 Feb 2025", time: "9:00", duration: "50m", trainer: trainer, isRegistered: false),
            GymClass(name: "Pilates", day: "Wednesday 25 Feb 2025", time: "11:00", duration: "40m", trainer: trainer, isRegistered: false)
        ]
        gymClassesByDay = Dictionary(grouping: classes, by: { $0.day })
        days = gymClassesByDay.keys.sorted()
    }

    private func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.register(GymClassCell.self, forCellReuseIdentifier: GymClassCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }


    private func toggleRegistration(for indexPath: IndexPath) {
        let day = days[indexPath.section]
        guard var gymClass = gymClassesByDay[day]?[indexPath.row] else { return }
        gymClass.isRegistered.toggle()
        gymClassesByDay[day]?[indexPath.row] = gymClass

        let alert = UIAlertController(
            title: nil,
            message: gymClass.isRegistered ?
                "Registered to \(gymClass.name)" :
                "Cancelled \(gymClass.name)",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))

        present(alert, animated: true)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

}

// MARK: - TableView delegate
extension GymViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gymClassesByDay[days[section]]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return days[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let gymClass = gymClassesByDay[days[indexPath.section]]?[indexPath.row],
              let cell = tableView.dequeueReusableCell(withIdentifier: GymClassCell.identifier, for: indexPath) as? GymClassCell else {
            return UITableViewCell()
        }
        cell.configure(with: gymClass)
        cell.onToggleRegistration = { [weak self] in
            self?.toggleRegistration(for: indexPath)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let day = days[indexPath.section]
            gymClassesByDay[day]?.remove(at: indexPath.row)
            
            if gymClassesByDay[day]?.isEmpty == true {
                gymClassesByDay.removeValue(forKey: day)
                days.removeAll { $0 == day }
                tableView.deleteSections(IndexSet(integer: indexPath.section), with: .fade)
            } else {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
}
