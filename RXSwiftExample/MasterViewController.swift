//
//  MasterViewController.swift
//  RXSwiftExample
//
//  Created by Silas S. Caxias on 20/03/21.
//

import UIKit

class MasterViewController: UIViewController {
    
    @IBOutlet weak var characterLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectCharacter(_ sender: UIButton) {
        guard let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        
        detailViewController.delegate = self
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension MasterViewController: CharacterDelegate {
    func didSelectCharacter(_ name: String) {
        characterLabel.text = "Hello \(name)"
    }
}
