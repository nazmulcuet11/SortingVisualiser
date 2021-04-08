//
//  AlgorithmPickerVC.swift
//  SortingVisualiser
//
//  Created by Nazmul's Mac Mini on 8/4/21.
//

import UIKit

class AlgorithmPickerVC: UIViewController, NibBased {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        title = "Sorting Visualizer"

        tableView.dataSource = self
        tableView.delegate = self

        tableView.registerCell(UITableViewCell.self)
    }
}

extension AlgorithmPickerVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SortingAlgorithmType.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let algorithmType = SortingAlgorithmType.allCases[indexPath.row]
        let cell = tableView.dequeueReusableCell(UITableViewCell.self, for: indexPath)
        cell.textLabel?.text = algorithmType.dataProvider.algorithmName
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension AlgorithmPickerVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let algorithmType = SortingAlgorithmType.allCases[indexPath.row]
        let visualiserVC = VisualiserVC.instantiate()
        visualiserVC.dataProvider = algorithmType.dataProvider
        navigationController?.pushViewController(visualiserVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AlgorithmPickerVC {
    enum SortingAlgorithmType: CaseIterable {
        case bubbleSort, selectionSort

        var dataProvider: SortingDataProvider {
            switch self {
            case .bubbleSort: return BubbleSort()
            case .selectionSort: return SelectionSort()
            }
        }
    }
}
