
import SwiftUI

struct SignUpView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var firstname: String = ""
    @State var lastname: String = ""
    @State var code: String = ""
    var body: some View {
        ZStack {
            Image("bin")
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
                .opacity(0.3)
            VStack {
                Text("Details".uppercased())
                    .font(.system(size: 60))
                    .foregroundColor(Color(.white))
                    .bold()
                    .frame(width: 300, height: 80, alignment: .center)
                    .background(Color("WelcomeViewColor"))
                    .cornerRadius(12.0)
                    .padding(.top , 10.0)
                .padding (10.0)
                TextField("First Name", text: $firstname)
                                .padding(10)
                                .background(Color("lightgreycolor"))
                                .frame(width: 280, height: 60, alignment: .center)
                                .cornerRadius(20.0)
                TextField("Last Name", text: $lastname)
                                .padding(10)
                                .background(Color("lightgreycolor"))
                                .frame(width: 280, height: 60, alignment: .center)
                                .cornerRadius(20.0)
                TextField("Postal Code", text: $code)
                                .padding(10)
                                .background(Color("lightgreycolor"))
                                .frame(width: 280, height: 60, alignment: .center)
                                .cornerRadius(20.0)
                TextField("Username", text: $username)
                                .padding(10)
                                .background(Color("lightgreycolor"))
                                .frame(width: 280, height: 60, alignment: .center)
                                .cornerRadius(12.0)
                SecureField("Password", text: $password)
                                .padding(10)
                                .background(Color("lightgreycolor"))
                                .frame(width: 280, height: 60, alignment: .center)
                                .cornerRadius(12.0)
                Button(action: {})
                    {
                        ButtonText(text: "Sign Up".uppercased())
                    }
                .foregroundColor(Color.white)
                .cornerRadius(21.0)
                .overlay(
                        RoundedRectangle(cornerRadius: 21.0)
                            .strokeBorder(Color.white, lineWidth:2.0)
                    )
                Spacer()
                
                
            }
    }
}
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
