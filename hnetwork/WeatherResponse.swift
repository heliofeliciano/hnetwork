struct WeatherResponse : Decodable {
    let name : String
    let weather : [WeatherAPI]
    let main : MainAPI
}

struct WeatherAPI : Decodable {
    let description : String
}

struct MainAPI : Decodable {
    let temp : Double
    let pressure : Double
    let humidity : Double
}
