//
//  ViewController.swift
//  SortingVisualiser
//
//  Created by Nazmul's Mac Mini on 7/4/21.
//

import UIKit



class VisualiserVC: UIViewController, StoryboardBased {

    @IBOutlet weak var visualizationContainer: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var shuffleButton: UIButton!
    private var collectionView: UICollectionView!

    var barWidth: CGFloat = 10
    var barSpacing: CGFloat = 2
    var dataProvider = VisualizerDataProvider()
    var sortingAlgorithm: SortingAlgorithm!

    private var dataSource: UICollectionViewDiffableDataSource<Int, DataPoint>!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = sortingAlgorithm.name

        setupCollectionView()
        configureDataSource()

        dataProvider.prepareIntialData(
            for: collectionView,
            barWidth: barWidth,
            spacing: barSpacing
        )

        applyProvidersDataToUI()
    }

    override var shouldAutorotate: Bool {
        return false
    }

    @IBAction func didTapStartButton(_ sender: Any) {
        let states = sortingAlgorithm.getIntermediateSortingSteps(dataPoints: dataProvider.data)
        applySortingState(at: 0, states: states)
    }

    @IBAction func didTapShuffleButton(_ sender: Any) {
        dataProvider.shuffle()
        applyProvidersDataToUI()
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()

        let height = visualizationContainer.bounds.height
        layout.itemSize = CGSize(width: barWidth, height: height)
        layout.minimumInteritemSpacing = barSpacing

        let collectionView = UICollectionView(
            frame: visualizationContainer.bounds,
            collectionViewLayout: layout
        )
        visualizationContainer.addSubview(collectionView)

        collectionView.isScrollEnabled = false

        collectionView.registerNibCell(BarCell.self)

        self.collectionView = collectionView
    }

    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, DataPoint>(collectionView: collectionView) {
            collectionView, indexPath, dataPoint in
            let cell = collectionView
                .dequeueReusableCell(
                    withReuseIdentifier: BarCell.reuseId,
                    for: indexPath
                ) as! BarCell
            cell.barHeight = dataPoint.height
            cell.color = dataPoint.color
            return cell
        }
    }

    private func applyDataChangeToUI(dataPoints: [DataPoint]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, DataPoint>()
        snapshot.deleteAllItems()
        snapshot.appendSections([0])
        snapshot.appendItems(dataPoints, toSection: 0)
        dataSource.apply(snapshot)
    }

    private func disableButtons() {
        startButton.isEnabled = false
        shuffleButton.isEnabled = false
    }

    private func enableButtons() {
        startButton.isEnabled = true
        shuffleButton.isEnabled = true
    }

    private func applySortingState(at index: Int, states: [[DataPoint]]) {
        guard index < states.count else {
            enableButtons()
            return
        }

        disableButtons()
        applyDataChangeToUI(dataPoints: states[index])
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.applySortingState(at: index + 1, states: states)
        })
    }

    private func applyProvidersDataToUI() {
        let dataPoints = dataProvider.data
        applyDataChangeToUI(dataPoints: dataPoints)
    }
}

