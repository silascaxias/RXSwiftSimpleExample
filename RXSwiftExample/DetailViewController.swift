//
//  DetailViewController.swift
//  RXSwiftExample
//
//  Created by Silas S. Caxias on 20/03/21.
//

import UIKit
import RxSwift

class DetailViewController: UIViewController {
    
    private let selectedCharacterVariable = BehaviorSubject(value: "User")
    
    var selectedCharacter:Observable<String> {
        return selectedCharacterVariable.asObservable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didSelectedCharacter(_ sender: UIButton) {
        guard let characterName = sender.titleLabel?.text else { return }
        
        selectedCharacterVariable.on(.next(characterName))
    }
}
