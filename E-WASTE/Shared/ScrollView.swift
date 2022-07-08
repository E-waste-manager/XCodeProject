import SwiftUI

struct ScrollView1: View {
    var body: some View {
        VStack{
            Spacer()
            ZStack {
                HStack {
                    RoundedRectangle(cornerRadius:60.0)
                        .fill(Color("darkgreycolor"))
                        .opacity(0.5)
                        .frame(width: 380, height: 250 , alignment: .center)
                }
                .padding()
                ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<10) {
                                Text("Item \($0)")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .frame(width: 200, height: 150)
                                    .background(Color("darkgreycolor"))
                                    .cornerRadius(42.0)
                            }
                            .padding(.bottom , 10.0)
                        }
                    }
                }
            }
    }
}

struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView1()
    }
}
