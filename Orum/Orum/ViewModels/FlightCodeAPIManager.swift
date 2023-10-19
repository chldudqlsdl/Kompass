//
//  FlightCodeAPIManager.swift
//  Orum
//
//  Created by Youngbin Choi on 10/19/23.
//

import Foundation

struct FlightCodeAPIManager {
    func performRequest(_ flightCode : String = "oz107", completion: @escaping (FlightInfo?) -> Void) {
        let urlString = "https://airlabs.co/api/v9/flight?flight_iata=\(flightCode)&api_key=62ae5826-8d19-4851-8c80-fd6d8e38e7d7"
        print(urlString)
        let url = URL(string: urlString)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            if let safeData = data {
                if let flightData = parseJSON(safeData){
                    DispatchQueue.main.async {
                        completion(flightData)
                    }
                } else {
                    completion(nil)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(_ flightData: Data) -> FlightInfo? {
        let decoder = JSONDecoder()
        do {
            print("hello")
            let decodedData = try decoder.decode(FlightCodeAPIData.self, from: flightData)
            let dep_city = decodedData.response.dep_city
            let arr_city = decodedData.response.arr_city
            let dep_time = decodedData.response.dep_time
            let arr_time = decodedData.response.arr_time
            
            let flightInfo = FlightInfo(dep_city: dep_city, arr_city: arr_city, dep_time: dep_time, arr_time: arr_time)
            return flightInfo
            
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
