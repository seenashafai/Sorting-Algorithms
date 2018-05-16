//
//  Sorts.swift
//  Sorting Algorithms
//
//  Created by Seena Shafai on 05/05/2018.
//  Copyright © 2018 Seena Shafai. All rights reserved.
//

import Foundation

class Sorts
{
     
    //MARK: - Bubble Sort Function
    func bubbleSort(array: [Int]) -> [Int]
    {
        //Declare Variables
        var a: Array = array
        let len: Int = a.count
        var temp: Int = 0

        //Initialise Boolean which will be used to break the loop once sorted
        var sorted: Bool = false
        
        while sorted == false
        {
            //Start for loop for length of array
            for _ in 0 ..< len
            {
                //Start another foor loop for length of one less than the array
                for j in 0 ..< len - 1
                {
                    //Checks if the current index is greater than the next index
                    if a[j] > a[j+1]
                    {
                        //Swaps the greater value for the lesser value
                        temp = a[j+1]
                        a[j+1] = a[j]
                        a[j] = temp
                    }
                    //Executed if the current index is smaller than the next index (i.e. sorted)
                    else
                    {
                        sorted = true
                    }
                }
            }
        }
        //Return the array
        return a
    }

    
    //MARK: - Selection Sort Function
    func selectionSort(array: [Int]) -> [Int]
    {
        var a: Array = array
        let len: Int = a.count
        
        for i in 0 ..< len - 1
        {
            var min = i
            for j in i+1 ..< len
            {
                if a[j]  < a[min]
                {
                    min = j
                }
            }
            if i != min
            {
                a.swapAt(i, min)
            }
        }
        
    return a
    }
    
    //MARK: - Merge Sort Functions
    func mergeSort(array: [Int]) -> [Int]
    {
        //Stop function if array is smaller than 1
        guard array.count > 1 else { return array }
        
        //Define the midpoint of the array
        let middleIndex = array.count / 2
        
        //Split the array in half from the midpoint
        let leftArray = mergeSort(array: Array(array[0..<middleIndex]))
        let rightArray = mergeSort(array: Array(array[middleIndex..<array.count]))
        
        //Send the left and right parts as individual arrays into the next function
        return merge(left: leftArray, right: rightArray)
        
    }
    
    private func merge(left: [Int],right: [Int]) -> [Int]
    {
        //Start the indices for each half at 0
        var leftIndex = 0
        var rightIndex = 0
        
        var orderedArray: [Int] = []
        
        //While the current index is smaller than the array length
        while leftIndex < left.count && rightIndex < right.count
        {
            //Define individual elements with their respective indices
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]
            
            //If the current index of the left array is smaller than the current index of the right array
            if leftElement < rightElement
            {
                //Add the item from the left array to the sorted array
                orderedArray.append(leftElement)
                
                //Increment the left array index by 1
                leftIndex += 1
            }
                
            //If the current index of the left array is greater than the current index of the right array
            else if leftElement > rightElement
            {
                //Add the item from the right array to the sorted array
                orderedArray.append(rightElement)
                
                //Increment the right array index by 1
                rightIndex += 1
            }
                
            //If the current indices of both arrays are equal
            else
            {
                //Place the current value from both arrays (in either order) into the sorted array
                orderedArray.append(leftElement)
                orderedArray.append(rightElement)

                //Increment both index counters
                leftIndex += 1
                rightIndex += 1
            }
        }
        //While the left index is smaller than the array length
        while leftIndex < left.count
        {
            //Append everything else from the left array into the sorted array
            orderedArray.append(left[leftIndex])
            
            //Increment the left index counter
            leftIndex += 1
        }
        //While the right index is smaller than the array length
        while rightIndex < right.count
        {
            //Append everything else from the left array into the sorted array
            orderedArray.append(right[rightIndex])
            
            //Increment the right index counter
            rightIndex += 1
        }
        
        //Return the sorted array
        return orderedArray
    }
    
    //MARK: Book Merge Sort (Inefficient)
    func bookMergeSort(array: [Int]) -> [Int]
    {
        var a = array
        let len = a.count
        
        if len > 1
        {
            let mid = len / 2
            var leftHalf = Array(a[0..<mid])
            var rightHalf = Array(a[mid..<len])
            
            bookMergeSort(array: leftHalf)
            bookMergeSort(array: rightHalf)
            var i = 0
            var j = 0
            var k = 0
            while i < leftHalf.count && j < rightHalf.count
            {
                if leftHalf[i] < rightHalf[j]
                {
                    a[k] = leftHalf[i]
                    i = i + 1
                }
                else
                {
                    a[k] = rightHalf[j]
                    j = j + 1
                }
                k = k + 1
            }
            while i < leftHalf.count
            {
                a[k] = leftHalf[i]
                i = i + 1
                k = k + 1
            }
            while j < rightHalf.count
            {
                a[k] = rightHalf[j]
                j = j + 1
                k = k + 1
            }
        }
        print(a)
        return a
    }
    
    //MARK: - Insertion Sort
    func insertionSort(array: [Int]) -> [Int]
    {
        //Declare variables
        var a = array
        let len = a.count
        var temp = 0
        
        //Begin for loop for length of array
        for i in 0 ..< len
        {
            //Assign new variable for the while loop
            var j = i
            //Runs whilst the array index is greater than 0, and if the next value in the array is smaller than the current one
            while j > 0 && a[j] < a[j-1]
            {
                //Swaps the current (greater) value for the smaller one
                temp = a[j]
                a[j] = a[j-1]
                a[j-1] = temp
                
                //Check the previous position to see if the value needs to be moved down further
                j = j - 1
            }
        }
        //Return the array
        return a
    }
    
    func hoarePartition(_ theArray: inout [Int], low: Int, high: Int) -> Int {
        let pivot = theArray[low]
        var i = low - 1
        var j = high + 1
        print("Pivot: \(pivot), i: \(i), j: \(j)")
        while true {
            repeat {j -= 1} while theArray[j] > pivot
            print(i)
            repeat { i += 1} while theArray[i] < pivot
            print(j)
            if i < j {theArray.swapAt(i, j)}
            else {return j}
        }
    }
    
    func hoareQuickSort(_ unsortedArray: inout [Int], low: Int, high: Int) {
        if low < high {
            let p = hoarePartition(&unsortedArray, low: low, high: high)
            print(p)
            hoareQuickSort(&unsortedArray, low: low, high: p)
            hoareQuickSort(&unsortedArray, low: p + 1, high: high)
        }
    }
    //MARK: - Quick Sorts
    func quickSortBasic(array: [Int]) -> [Int]
    {
        //Declare variables
        var a = array
        let len = a.count
        //Stop the quick sort when the array size becomes smaller than 1
        guard len > 1 else
        {
            return a
        }
        //Set the pivot to the midpoint of the array
        let pivot = a[len / 2]
        //Find the numbers lower than the pivot
        let lesserNumbers = a.filter{$0 < pivot}
        //Find the number(s) in the midpoint
        let equalNumbers = a.filter{$0 == pivot}
        print("equal","\(equalNumbers)")
        let greaterNumbers = a.filter{$0 > pivot}
        print("\(greaterNumbers)")
        return quickSortBasic(array: lesserNumbers) + equalNumbers + quickSortBasic(array: greaterNumbers)
    }
    
    
}
