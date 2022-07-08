
import SwiftUI


struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var token : String = ""
    @State private var isAuthenticated = false
    @State private var SignUpIsShowing = false
    @State var ismapshowing = false
    @Environment(\.colorScheme) var colorScheme
    func login() async {
        guard let url = URL(string: "https://e-waste-backend.herokuapp.com" + "/auth/login?" + "username=\(username)&" + "password=\(password)")
        else{
            print("invalid URL")
            return
        }
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            if let decodedResponse = try? decoder.decode(String.self, from: data){
                DispatchQueue.main.async {
                    print(decodedResponse)
                    self.token = decodedResponse
                    ismapshowing = true
                }
            }
            else{
                    print("cannot decode URL")
                }
            }
            catch {
                print("Invalid data")
            }
        let user = User(username: self.username, token: self.token)
        let encoder = JSONEncoder()
        if let data2 = try? encoder.encode(user){
            UserDefaults.standard.set(data2, forKey: "UserDAta")
            isAuthenticated = true
            print(token)
        }
    }
    var body: some View {
        NavigationView{
            ZStack {
                if colorScheme == .light {
                    Image("background")
                        .edgesIgnoringSafeArea(.all)
                        .scaledToFill()
                        .opacity(0.3)
                }
                else {
                    Image("1")
                        .edgesIgnoringSafeArea(.all)
                        .scaledToFill()
                        .opacity(0.3)
                }
                VStack{
                    Text("Welcome".uppercased())
                        .font(.system(size: 50))
                        .foregroundColor(Color(.white))
                        .bold()
                        .padding()
                        .frame(width: 300, height: 100, alignment: .center)
                        .background(Color("WelcomeViewColor"))
                        .cornerRadius(12.0)
                        .padding(.bottom , 50)
                    TextField("Username", text: $username)
                                    .padding()
                                    .background(Color("lightgreycolor"))
                                    .frame(width: 280, height: 60, alignment: .center)
                                    .cornerRadius(12.0)
                                    .padding(.bottom, 15)
                    SecureField("Password", text: $password)
                                    .padding()
                                    .background(Color("lightgreycolor"))
                                    .frame(width: 280, height: 60, alignment: .center)
                                    .cornerRadius(12.0)
                                    .padding(.bottom,1.0)
                    NavigationLink(destination: SearchView() .navigationBarHidden(true), isActive: $ismapshowing) { EmptyView() }
                    AsyncButton(action: login){
                        ButtonText(text: "Login")
                    }
                    .foregroundColor(Color.white)
                    .cornerRadius(21.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 21.0)
                           .strokeBorder(Color.white, lineWidth:2.0)
                        )
                    .padding(10)
                    
                    NavigationLink(destination: SignUpView(), isActive: $SignUpIsShowing) { EmptyView() }
                    Button(action: {
                        SignUpIsShowing = true
                    })
                        {
                            ButtonText(text: "Sign Up")
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
}

struct ButtonText: View {
    var text: String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .padding()
            .frame(width: 200, height: 50, alignment: .center)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(12.0)
    }
}


