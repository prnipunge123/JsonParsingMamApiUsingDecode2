//
//  ViewController.swift
//  JsonParsingMamApiUsingDecode2
//
//  Created by Mac on 06/11/23.
//

import UIKit

class ViewController: UIViewController {
    var  apiResPonse : ApiResponse?

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataApiResponse()
    }
    func fetchDataApiResponse(){
        let url = URL(string: "https://api.teleport.org/api/urban_areas/teleport%3A9q8yy/scores/")
        let urlRequest = URLRequest(url: url!)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) {
            data, response,error in
            self.apiResPonse = try! JSONDecoder().decode(ApiResponse.self, from: data!)
        }
        dataTask.resume()
    }
}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let prouct  = UITableViewCell()
        return  prouct
    }
}
extension ViewController : UITableViewDelegate{
    
}
