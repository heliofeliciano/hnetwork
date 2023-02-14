import Foundation

class ViewModel: ObservableObject {
    
    var weatherData: WeatherResponse?
    
    let cityURL = "https://api.openweathermap.org/data/2.5/weather?q=natal&appid=6c30f17166171a6f838e635f572cd32d&units=metric"
    
    init() {
        WeatherService.getData(urlCity: cityURL) { result in
            switch result {
            case .success(let data):
                self.weatherData = data
                print("[SUCCESS] \(data)")
            case .failure(let error):
                print("[ERROR] \(error)")
            }
        }
    }
}
