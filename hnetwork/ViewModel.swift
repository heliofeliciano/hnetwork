import Foundation

class ViewModel: ObservableObject {
    
    var temp: Double
    
    init() {
        temp = 0
        getData()
    }
    
    func getData() {
        let weatherURL = "https://api.openweathermap.org/data/2.5/weather?q=delhi&appid={YOUR-API-KEY}&units=metric"
        
        guard let url = URL(string: weatherURL) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard data != nil else {
                print("[ERROR] data is nil")
                return
            }
            
            let decoder = JSONDecoder()
            let decodedData = try? decoder.decode(WeatherResponse.self, from: data!)
            
            DispatchQueue.main.async {
                self.temp = (decodedData?.main.temp)!
            }
        }.resume()
    }
}
