import SwiftUI

struct PupView: View {
    @State private var soundCont: Int = 1
    var pupName: String
    var frameSize: CGFloat
    var parentOffset: CGSize
    var imageBackgroundColor: Color
    var maxSoundCount: Int = 2
    
    var body: some View {
        HStack {
            ZStack {
                Button(action: {
                    AudioPlayer.shared.play(sound: "\(self.pupName)\(self.soundCont)", type: "m4a")
                    self.soundCont += 1
                    if self.soundCont > self.maxSoundCount {
                        self.soundCont = 1
                    }
                }) {
                    Rectangle().frame(width: frameSize, height: frameSize).opacity(0.0).border(Color.yellow, width: 5).background(imageBackgroundColor).shadow(color: Color.black, radius: 5, x: 5, y: 5)
                    Image(pupName).resizable().background(imageBackgroundColor).frame(width: frameSize-10, height: frameSize-10)
                }.buttonStyle(PuppyButtonStyle())
            }
        }.offset(self.parentOffset)
    }
}

#if DEBUG
struct PupView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PupView(pupName: "Chase", frameSize: 150, parentOffset: CGSize(width: 0,height: 0), imageBackgroundColor: Color.blue)
            PupView(pupName: "Rocky", frameSize: 150, parentOffset: CGSize(width: 0,height: 0), imageBackgroundColor: Color(UIColor(hexString:"99DD33")))
            PupView(pupName: "Skye", frameSize: 150, parentOffset: CGSize(width: 0,height: 0), imageBackgroundColor: Color(UIColor(hexString:"FF6666")))
            PupView(pupName: "Zuma", frameSize: 150, parentOffset: CGSize(width: 0,height: 0), imageBackgroundColor: Color(UIColor(hexString:"FF9933")))
            PupView(pupName: "Rubble", frameSize: 150, parentOffset: CGSize(width: 0,height: 0), imageBackgroundColor: Color(UIColor(hexString:"FFFF99")))
            PupView(pupName: "Marshall", frameSize: 150, parentOffset: CGSize(width: 0,height: 0), imageBackgroundColor: Color(UIColor(hexString:"FF6633")))
        }
    }
}
#endif

struct PuppyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.7 : 1)
    }
}
