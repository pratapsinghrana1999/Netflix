//
//  APICaller.swift
//  Netflix
//
//  Created by Apple on 26/09/23.
//

import Foundation

struct Constants {
    
    static let API_KEY = "cd9e1b8b3aef029162bf76b80c0db36f"
    static let baseURL = "https://api.themoviedb.org"
    
}

enum APIError : Error {
    case failedToGetData
}

class APICaller {
    
    static let shared = APICaller()
    
    func getTrendingMovies(completion : @escaping (Result<[Movie], Error>)-> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(MoviesResponse.self, from: data)
                completion(.success(result.results))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTrendingTvShows(completion : @escaping (Result<[Tv], Error>)-> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(TvResponse.self, from: data)
                completion(.success(result.results))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion : @escaping (Result<[Movie], Error>)-> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(MoviesResponse.self, from: data)
                completion(.success(result.results))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getPopularMovies(completion : @escaping (Result<[Movie], Error>)-> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(MoviesResponse.self, from: data)
                completion(.success(result.results))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getTopRatedMovies(completion : @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let decoder = JSONDecoder()
                let result = try decoder.decode(MoviesResponse.self, from: data)
                completion(.success(result.results))
            }
            catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
