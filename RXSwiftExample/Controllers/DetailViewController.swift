//
//  DetailViewController.swift
//  RXSwiftExample
//
//  Created by Silas S. Caxias on 20/03/21.
//

import UIKit
import RxSwift

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var notes = ["do", "re", "mi", "fa", "sol", "la", "si", "do2"]
    
    private var dataSource: [NoteTableViewCell] {
        (0...7).map({
            NoteTableViewCell.setup(tableView: self.tableView, note: Note(name: notes[$0].capitalized, resource: notes[$0]))
        })
    }
    
    private let selectedNotesBehavior = BehaviorSubject<[Note]>(value: [])
    var selectedNotes:BehaviorSubject<[Note]> {
        return selectedNotesBehavior
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func modifyNotesWith(_ note: Note?) {
        guard var currentValues = try? selectedNotes.value(), let note = note else { return }
        
        if(currentValues.contains(where: { $0.name == note.name })){
            currentValues.removeAll(where: {$0.name == note.name})
        } else {
            currentValues.append(note)
        }
        selectedNotesBehavior.onNext(currentValues)
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        dataSource[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        modifyNotesWith(dataSource[indexPath.row].note)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        modifyNotesWith(dataSource[indexPath.row].note)
    }
}
