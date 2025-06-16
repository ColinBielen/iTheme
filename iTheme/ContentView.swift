import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        ZStack {
            Image("bhc")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Button(action: {
                    self.playSound()
                }) {
                    Text("Play Beverly Hills Cop Theme")
                        .padding()
                        .background(Color.blue.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: {
                    self.stopSound()
                }) {
                    Text("Stop")
                        .padding()
                        .background(Color.red.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }

    func playSound() {
        if let url = Bundle.main.url(forResource: "axel_f", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        } else {
            print("Audio file not found")
        }
    }

    func stopSound() {
        audioPlayer?.stop()
    }
}
