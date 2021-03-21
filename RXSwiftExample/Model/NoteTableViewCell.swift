//
//  NoteTableViewCell.swift
//  RXSwiftExample
//
//  Created by Silas S. Caxias on 20/03/21.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    var note: Note? = nil
    
    static func setup(tableView: UITableView, note: Note) -> NoteTableViewCell {
        tableView.register(NoteTableViewCell.self, forCellReuseIdentifier: String(describing: NoteTableViewCell.self))
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NoteTableViewCell.self)) as? NoteTableViewCell, let label = cell.textLabel {
            label.text = note.name
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.regular)
            cell.note = note
            return cell
        }
            
        return NoteTableViewCell()
    }
}
