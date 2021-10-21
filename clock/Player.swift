//
//  Player.swift
//  clock
//
//  Created by Rafael Almeida on 21/10/21.
//

import AVFoundation

class Player {
    var player: AVAudioPlayer?

    func playSound() {
        guard let url = Bundle.main.url(forResource: "tic", withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
