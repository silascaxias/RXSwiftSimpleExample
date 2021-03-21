//
//  MasterViewController.swift
//  RXSwiftExample
//
//  Created by Silas S. Caxias on 20/03/21.
//

import UIKit
import RxSwift

class MasterViewController: UIViewController {
    
    var notes: [Note] = []
    let disposedBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectCharacter(_ sender: UIButton) {
        guard let detailViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as? DetailViewController else { return }
        
        detailViewController.selectedNotes.asObservable().subscribe (onNext: { [weak self] notes in
            self?.notes = notes
        }).disposed(by: disposedBag)
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    @IBAction func playSongs(_ sender: UIButton) {
        if(notes.count == 0) {
            let alert = UIAlertController(title: "Alert", message: "No music notes. Go to note selection for add.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        notes.forEach({ $0.play() })
    }
}
