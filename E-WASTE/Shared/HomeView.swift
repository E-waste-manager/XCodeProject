import SwiftUI
import MapKit

struct Coordinate : Encodable {
//    var id: ObjectIdentifier
    
    var latitude : Double
    var longitude : Double
}

struct Response :  Decodable {
    let address: String
    let distance: String
    let name: String
}

struct HomeView: View {
    
    @State var coordinates : CLLocationCoordinate2D
    @State var recyclerList : [Response]
    
    func locationProvider() async{
        let coordinates_stored = Coordinate.init(latitude: coordinates.latitude, longitude: coordinates.longitude)
        guard let encoded = try? JSONEncoder().encode(coordinates_stored)
        else{
            print("Failed to encode order")
            return
        }
        guard let url = URL(string:"https://e-waste-backend.herokuapp.com/api/waste") else { return }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        
        do{
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            print(data)
            let decoder = JSONDecoder()
            print("hello world")
            let decodedData = try decoder.decode([Response].self, from: data)
            self.recyclerList = decodedData
            print(recyclerList)
        }
        catch {
            print("Cannot get URL")
        }
        
    }
    
    var body: some View {
        ZStack{
            ScrollView1()
            AsyncButton(action: locationProvider){
            Text("Provide Recyclers")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(coordinates: CLLocationCoordinate2D(latitude: 0, longitude: 0),recyclerList: [])
    }
}
}
