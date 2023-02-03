//
//  DetailsViewController.swift
//  PokedexViewCode
//
//  Created by Felipe Domingos on 17/12/22.
//

import UIKit
import ColorKit

class DetailsViewController: UIViewController {
    
    private let data: String
    init(data: String) {
        self.data = data
        super.init(nibName: "DetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let detailsView: DetailsViewScreen? = DetailsViewScreen()
    let rest = RestManager()
    var dataTable: [Stats] = []
    let dataTableNames = [("HP"), ("ATK"), ("DEF"), ("S-ATK"), ("S-DEF"), ("SPD")]
    
    override func loadView() {
        self.view = self.detailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailsView?.configTableViewProtocols(delegate: self, dataSource: self)
        view.backgroundColor = .white
        self.rest.validatepokemonDetails(name: data) { details in
            self.detailsView?.addDetailsData(data: details)
            self.detailsView?.addDataTypes(data: details)
            self.addData(data: details)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func addData(data: Register) {
        dataTable = data.stats
        detailsView?.tableView.reloadData()
    }
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HabilitiesTableViewCell? = tableView.dequeueReusableCell(withIdentifier: HabilitiesTableViewCell.indentifier, for: indexPath) as? HabilitiesTableViewCell
        cell?.addDataHabName(data: dataTable[indexPath.row])
        cell?.habilities.text = dataTableNames[indexPath.row]
        
        let selectedIndex = indexPath
        if selectedIndex == indexPath {cell?.backgroundColor = .white}
        
        switch indexPath.row {
        case 0:
            cell?.statsView.backgroundColor = .systemRed
        case 1:
            cell?.statsView.backgroundColor = .systemTeal
        case 2:
            cell?.statsView.backgroundColor = .init(UIColor(red: 246/255, green: 107/255, blue: 158/255, alpha: 1.0))
        case 3:
            cell?.statsView.backgroundColor = .init(UIColor(red: 91/255, green: 194/255, blue: 145/255, alpha: 1.0))
        case 4:
            cell?.statsView.backgroundColor = .init(UIColor(red: 128/255, green: 176/255, blue: 222/255, alpha: 1.0))
        case 5:
            cell?.statsView.backgroundColor = .systemPurple
        default:break
        }
        
        return cell ?? UITableViewCell()
    }
}

