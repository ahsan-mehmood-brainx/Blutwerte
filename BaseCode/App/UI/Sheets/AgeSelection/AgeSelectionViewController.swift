//
//  AgeSelectionViewController.swift
//  BaseCode
//
//  Created by BrainX IOS Dev on 28/08/2023.
//

import UIKit

class AgeSelectionViewController: ViewController<AgeSelectionViewModel> {
    
    //MARK: - Outlets
    
    @IBOutlet var ageSelectionView: AgeSelectionView!
    
    //MARK: - Properties
    
    private var selectedRow = 0
    var ageClosure: ((_ age: Int) -> Void)?
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        addTargets()
    }
    
    //MARK: - Action Methods
    
    @objc
    func dismissViewTapped() {
        viewModel.dimissView()
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        ageSelectionView.agePickerView.dataSource = self
        ageSelectionView.agePickerView.delegate = self
    }
    
    private func addTargets() {
        ageSelectionView.backgroundView.addGestureRecognizer(
            UITapGestureRecognizer(target: self,
                                   action: #selector(dismissViewTapped))
        )
        
    }
}

//MARK: - UIPickerViewDataSource Conformance

extension AgeSelectionViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        100
    }
}

//MARK: - UIPickerViewDelegate Conformance

extension AgeSelectionViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        String(row + 1)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row
        pickerView.reloadAllComponents()
    }
}
