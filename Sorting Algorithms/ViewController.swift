//
//  ViewController.swift
//  Sorting Algorithms
//
//  Created by Seena Shafai on 05/05/2018.
//  Copyright © 2018 Seena Shafai. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK: - Variables
    
    //MARK: Class References
    var sorts = Sorts()
    var numbers = Numbers()
    
    //MARK: Variable Declarations
    
    //Initialise array of random numbers for sorting
    var randNumArray = [Int]()
    
    //Array of sorting algorithms for UIPickerView titles
    var algorithmArray = ["Choose a Sort Method...", "Merge Sort", "Less Efficient Merge Sort", "Bubble Sort", "Selection Sort", "Insertion Sort", "Basic Quick Sort", "Hoare Quick Sort"]
    
    //MARK: IBOutlets
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var randNumLabel: UILabel!
    
    //MARK: - Functions
    
    //Function to generate random numbers
    @IBAction func generateAction(_ sender: Any)
    {
        randNumArray = numbers.randNumGenerator()
        let string = numbers.joinArray(array: randNumArray)
        
        //Reset UIPickerView Wheel
        resetPickerView()
        randNumLabel.text = string
        resultLabel.text = ""
    }
    
    func quickSortBasic()
    {
        let sortedArray = sorts.quickSortBasic(array: randNumArray)
        let string = numbers.joinArray(array: sortedArray)
        resultLabel.text = string
    }
    
    func quickSortHoare()
    {
        var unsorted = [5,7,3,8,2,9,10,14]
        let sortedArray = sorts.hoareQuickSort(&unsorted, low: 0, high: unsorted.count - 1)
        let string = numbers.joinArray(array: sortedArray)
        resultLabel.text = string
    }
    
    //Bubble Sort Function
    func bubbleSort()
    {
        let sortedArray = sorts.bubbleSort(array: randNumArray)
        let string = numbers.joinArray(array: sortedArray)
        resultLabel.text = string
    }
    
    //Selection Sort Function
    func selectionSort()
    {
        let sortedArray = sorts.selectionSort(array: randNumArray)
        let string = numbers.joinArray(array: sortedArray)
        resultLabel.text = string
    }
    
    //Merge Sort Function
    func mergeSort()
    {
        let sortedArray = sorts.mergeSort(array: randNumArray)
        let string = numbers.joinArray(array: sortedArray)
        resultLabel.text = string
    }
    
    //Merge Sort Function
    func bookMergeSort()
    {
        let sortedArray = sorts.bookMergeSort(array: randNumArray)
        let string = numbers.joinArray(array: sortedArray)
        resultLabel.text = string
    }
 
    //Insertion Sort Function
    func insertionSort()
    {
        let sortedArray = sorts.insertionSort(array: randNumArray)
        let string = numbers.joinArray(array: sortedArray)
        resultLabel.text = string
    }
    
    //MARK: - UIPickerViewDelegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return algorithmArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return algorithmArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if row == 1
        {
            if randNumArray.count < 1
            {
                alert()
            }
            else
            {
                mergeSort()
            }
        }
        if row == 2
        {
            if randNumArray.count < 1
            {
                alert()
            }
            else
            {
                bookMergeSort()
            }
        }
        if row == 3
        {
            if randNumArray.count < 1
            {
                alert()
            }
            else
            {
                bubbleSort()
            }
        }
        if row == 4
        {
            if randNumArray.count < 1
            {
                alert()
            }
            else
            {
                selectionSort()
            }
        }
        if row == 5
        {
            if randNumArray.count < 1
            {
                alert()
            }
            else
            {
                insertionSort()
            }
        }
        if row == 6
        {
            if randNumArray.count < 1
            {
                alert()
            }
            else
            {
                quickSortBasic()
            }
        }
        if row == 7
        {
            if randNumArray.count < 1
            {
                alert()
            }
            else
            {
                quickSortHoare()
            }
        }
    }
    
    //MARK: - View Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        roundCorners()
    }
    
    func alert()
    {
        let alertController = UIAlertController(title: "Info", message: "You must generate a list of numbers before choosing a sorting algorithm", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "Dismiss", style: .default) { (action:UIAlertAction) in
            print("Dismissed");
            self.resetPickerView()
        }

        alertController.addAction(action1)

        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - Private Functions
    
    //Round UILabel Corners
    private func roundCorners()
    {
        randNumLabel.layer.masksToBounds = true
        resultLabel.layer.masksToBounds = true
        randNumLabel.layer.cornerRadius = 10
        resultLabel.layer.cornerRadius = 10
    }
    
    private func resetPickerView()
    {
        pickerView.selectRow(0, inComponent: 0, animated: true)
    }
}

