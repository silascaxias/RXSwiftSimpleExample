//
//  Note.swift
//  RXSwiftExample
//
//  Created by Silas S. Caxias on 20/03/21.
//

import AVFoundation

class Note {
    let name: String
    let resource: String
    var player: AVAudioPlayer?
    
    init(name: String, resource: String) {
        self.name = name
        self.resource = resource
    }

    func play() {
        guard let path = Bundle.main.path(forResource: resource, ofType:"mp3") else { return}
        
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            player?.play()
            sleep(1)
        } catch {}
    }
}
