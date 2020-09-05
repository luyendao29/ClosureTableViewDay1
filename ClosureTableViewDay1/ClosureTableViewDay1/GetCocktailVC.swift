//
//  GetCocktailVC.swift
//  ClosureTableViewDay1
//
//  Created by Boss on 9/5/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

class GetCocktailVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var listCocktail = [CocktailModel]()
    var closures: ((_ data: CocktailModel) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CocktailCell.nib(), forCellReuseIdentifier: CocktailCell.identifier())
        if listCocktail.count == 0 {
            let url = URL(string: "https://www.thecocktaildb.com")
            let path = "/api/json/v1/1/search.php?f=a"
            let urlWithPath = url?.appendingPathComponent(path).absoluteString.removingPercentEncoding
            print(urlWithPath!)
            DataService.sharing.getData(urlString: urlWithPath!) {(data: BaseDataModel) in
                if let drinks = data.drinks {
                    self.listCocktail = drinks
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCocktail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CocktailCell.identifier(), for: indexPath) as? CocktailCell else {
            return UITableViewCell()
        }
        cell.infoCocktail = listCocktail[indexPath.row]
        cell.fillData()
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let list = listCocktail[indexPath.row]
        closures?(list)
        navigationController?.popViewController(animated: true)
    }
    
    
}
extension URL {
    
    func appending(_ queryItem: String, value: String?) -> URL {
        
        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }
        
        // Create array of existing query items
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        
        // Create query item
        let queryItem = URLQueryItem(name: queryItem, value: value)
        
        // Append the new query item in the existing query items array
        queryItems.append(queryItem)
        
        // Append updated query items array in the url component object
        urlComponents.queryItems = queryItems
        
        // Returns the url from new url components
        return urlComponents.url!
    }
}
