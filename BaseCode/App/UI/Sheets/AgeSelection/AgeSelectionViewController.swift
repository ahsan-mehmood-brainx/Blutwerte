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
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        configurePresentation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.handleDimiss()
    }
    
    //MARK: - Private Methods
    
    private func initialSetup() {
        ageSelectionView.agePickerView.dataSource = self
        ageSelectionView.agePickerView.delegate = self
        ageSelectionView.setupPicker(age: viewModel.selectedRow + 1)
    }
    
    private func configurePresentation() {
        let presentationController = presentationController as? UISheetPresentationController
        presentationController?.detents = [.custom(resolver: { _ in
            300
        })]
        presentationController?.prefersGrabberVisible = true
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
        viewModel.selectedRow = row
    }
}
