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
    @IBOutlet weak var animationSpeedSlider: UISlider!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var layout: UICollectionViewFlowLayout!


    //    private var collectionView: UICollectionView!

    var barWidth: CGFloat = 10
    var barSpacing: CGFloat = 2
    var dataProvider: SortingDataProvider!

    private var dataSource: UICollectionViewDiffableDataSource<Int, DataPoint>!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = dataProvider.algorithmName

        setupCollectionView()
        configureDataSource()
        prepareInitialData()
        applyProvidersDataToUI()
    }

    override var shouldAutorotate: Bool {
        return false
    }

    @IBAction func didTapStartButton(_ sender: Any) {
        let states = dataProvider.getIntermediateSortingSteps()
        applySortingState(at: 0, states: states)
    }

    @IBAction func didTapShuffleButton(_ sender: Any) {
        dataProvider.shuffle()
        applyProvidersDataToUI()
    }

    private func setupCollectionView() {
        let height = collectionView.bounds.height
        layout.itemSize = CGSize(width: barWidth, height: height)
        layout.minimumInteritemSpacing = barSpacing

        collectionView.registerNibCell(BarCell.self)
    }

    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, DataPoint>(collectionView: collectionView) {
            collectionView, indexPath, dataPoint in
            let cell = collectionView
                .dequeueReusableCell(
                    withReuseIdentifier: BarCell.reuseId,
                    for: indexPath
                ) as! BarCell
            cell.configure(with: dataPoint)
            return cell
        }
    }

    private func prepareInitialData() {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height

        let barCount = Int(floor((width + barSpacing) / (barWidth + barSpacing)))
        let minHeight: Double = 200
        let maxHeight: Double = Double(height)

        dataProvider.prepareInitialData(count: barCount, minHeight: minHeight, maxHeight: maxHeight)
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
        let animationSpeed = 1.01 - Double(animationSpeedSlider.value)
        DispatchQueue.main.asyncAfter(deadline: .now() + animationSpeed, execute: {
            self.applySortingState(at: index + 1, states: states)
        })
    }

    private func applyProvidersDataToUI() {
        let dataPoints = dataProvider.dataPoints
        applyDataChangeToUI(dataPoints: dataPoints)
    }
}

