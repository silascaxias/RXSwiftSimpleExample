//
//  MasterViewController.swift
//  RXSwiftExample
//
//  Created by Silas S. Caxias on 20/03/21.
//

import UIKit
import RxSwift

class MasterViewController: UIViewController {
    
    @IBOutlet weak var characterLabel: UILabel!
    
    let disposedBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectCharacter(_ sender: UIButton) {
        guard let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        
        detailViewController.selectedCharacter.subscribe (onNext: { [weak self] characterName in
            self?.characterLabel.text = "Hello \(characterName)"
        }).disposed(by: disposedBag)
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
