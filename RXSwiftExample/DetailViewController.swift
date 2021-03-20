//
//  DetailViewController.swift
//  RXSwiftExample
//
//  Created by Silas S. Caxias on 20/03/21.
//

import UIKit

protocol CharacterDelegate {
    func didSelectCharacter(_ name:String)
}

class DetailViewController: UIViewController {
    
    var delegate: CharacterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didSelectedCharacter(_ sender: UIButton) {
        guard let selectedCharater = sender.titleLabel?.text,
              let delegate = self.delegate  else { return }
        
        delegate.didSelectCharacter(selectedCharater)
    }
}
