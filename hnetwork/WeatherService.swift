import Foundation

class WeatherService {
    
    static func getData(urlCity: String, completionHandler: @escaping (Result<WeatherResponse, NetworkError>) -> ()) {
        
        guard let url = URL(string: "\(urlCity)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard data != nil else {
                completionHandler(.failure(.timeOut))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(WeatherResponse.self, from: data!)
                
                DispatchQueue.main.async {
                    completionHandler(.success(decodedData))
                }
            } catch {
                DispatchQueue.main.async {
                    completionHandler(.failure(.cityNotFound))
                }
            }
        }.resume()
    }
}
