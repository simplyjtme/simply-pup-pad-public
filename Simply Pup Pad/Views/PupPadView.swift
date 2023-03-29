import SwiftUI

struct PupPadView: View {
    @State private var soundCont: Int = 1
    
    private let contentSizePercent: CGFloat = 0.306
    private let puppySizePercent: CGFloat = 0.83334
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("PupPadBlank").resizable()
                Button(action: {
                    AudioPlayer.shared.play(sound: "Ryder\(self.soundCont)", type: "m4a")
                    self.soundCont += 1
                    if self.soundCont > 5 {
                        self.soundCont = 1
                    }
                }) {
                    Image("PawLogoCenter").resizable().frame(width: truncateFloat(geometry.size.height, self.contentSizePercent), height: truncateFloat(geometry.size.height, self.contentSizePercent)).shadow(color: Color.black, radius: 5, x: 0, y: 0)
                }.buttonStyle(PawButtonStyle())
                PupView(pupName: "Chase", frameSize: calcFrameSize(geometry.size.height), parentOffset: CGSize(width: 0,height: -calcOffsetHelper(geometry.size.height)), imageBackgroundColor: Color.blue)
                PupView(pupName: "Rocky", frameSize: calcFrameSize(geometry.size.height), parentOffset: CGSize(width: 0,height: calcOffsetHelper(geometry.size.height)), imageBackgroundColor: Color(UIColor(hexString:"99DD33")))
                PupView(pupName: "Skye", frameSize: calcFrameSize(geometry.size.height), parentOffset: CGSize(width: -calcOffsetHelper(geometry.size.height),height: calcOffsetHelper(geometry.size.height)/2), imageBackgroundColor: Color(UIColor(hexString:"FF6666")))
                PupView(pupName: "Zuma", frameSize: calcFrameSize(geometry.size.height), parentOffset: CGSize(width: calcOffsetHelper(geometry.size.height),height: calcOffsetHelper(geometry.size.height)/2), imageBackgroundColor: Color(UIColor(hexString:"FF9933")))
                PupView(pupName: "Rubble", frameSize: calcFrameSize(geometry.size.height), parentOffset: CGSize(width: -calcOffsetHelper(geometry.size.height),height: -calcOffsetHelper(geometry.size.height)/2), imageBackgroundColor: Color(UIColor(hexString:"FFFF99")))
                PupView(pupName: "Marshall", frameSize: calcFrameSize(geometry.size.height), parentOffset: CGSize(width: calcOffsetHelper(geometry.size.height),height: -calcOffsetHelper(geometry.size.height)/2), imageBackgroundColor: Color(UIColor(hexString:"FF6633")))
            }
        }
    }
    
    func calcFrameSize(_ parentHeight: CGFloat) -> CGFloat {
        return truncateFloat(parentHeight, self.contentSizePercent)/2
    }
    
    func calcOffsetHelper(_ parentHeight:CGFloat) -> CGFloat {
        return truncateFloat(truncateFloat(parentHeight, self.contentSizePercent),self.puppySizePercent)
    }
    
    func truncateFloat(_ size: CGFloat, _ modifier: CGFloat) -> CGFloat {
        return CGFloat(trunc((size * modifier)))
    }
}

#if DEBUG
struct PupPadView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PupPadView()
                .previewDisplayName("iPad Pro (12.9-inch)").previewLayout(.fixed(width: 1366, height: 980))
            PupPadView()
                .previewDisplayName("iPad Mini 4").previewLayout(.fixed(width: 1024, height: 748))
            PupPadView()
                .previewDisplayName("iPhone 11 Pro").previewLayout(.fixed(width: 812, height: 375))
        }
    }
}
#endif

struct PawButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.7 : 1)
    }
}
