//
//  ViewController.swift
//  ClosureTableViewDay1
//
//  Created by Boss on 9/5/20.
//  Copyright © 2020 LuyệnĐào. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var contenView: UIView!
    @IBOutlet weak var button: UIButton!
    
    lazy var detailCocktailView: UIView = {
        let detailCocktailView: DetailView = DetailView.loadFromNib()
        //optionCableView.delegate = self
        detailCocktailView.frame = self.contenView.bounds
        self.contenView.addSubview(detailCocktailView)
        return detailCocktailView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 16
        setShadow(view: contenView)
        setShadow(view: detailCocktailView)
    }
    
    func setShadow(view: UIView) {
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
    }
    
    @IBAction func onTapAction(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "GetCocktailVC") as! GetCocktailVC
        vc.closures = { data in
            print("Đang thực thi Closure")
            self.showDataToView(dataCocktail: data)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    func showDataToView(dataCocktail: CocktailModel) {
        if let detailCocktailView = self.detailCocktailView as? DetailView {
            detailCocktailView.infoCoktail = dataCocktail
            detailCocktailView.fillData()
        }
    }
    
    
}

