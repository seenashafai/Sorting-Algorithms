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
        var a: Array = array
        let len: Int = a.count
        var temp: Int = 0

        var sorted: Bool = false
        while sorted == false
        {
            for _ in 0 ..< len
            {
                for j in 0 ..< len - 1
                {
                    if a[j] > a[j+1]
                    {
                        temp = a[j+1]
                        a[j+1] = a[j]
                        a[j] = temp
                    }
                    else
                    {
                        sorted = true
                    }
                }
            }
        }
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
        guard array.count > 1 else { return array }
        
        let middleIndex = array.count / 2
        
        let leftArray = mergeSort(array: Array(array[0..<middleIndex]))
        let rightArray = mergeSort(array: Array(array[middleIndex..<array.count]))
        
        return merge(left: leftArray, right: rightArray)
        
    }
    
    private func merge(left: [Int],right: [Int]) -> [Int]
    {
        var leftIndex = 0
        var rightIndex = 0
        
        var orderedArray: [Int] = []
        
        while leftIndex < left.count && rightIndex < right.count
        {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]
            
            if leftElement < rightElement
            {
                orderedArray.append(leftElement)
                leftIndex += 1
            }
            else if leftElement > rightElement
            {
                orderedArray.append(rightElement)
                rightIndex += 1
            }
            else
            {
                orderedArray.append(leftElement)
                leftIndex += 1
                orderedArray.append(rightElement)
                rightIndex += 1
            }
        }
        while leftIndex < left.count
        {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        }
        while rightIndex < right.count
        {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }
        
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
        var a = array
        let len = a.count
        var temp = 0
        
        for i in 0 ..< len
        {
            var j = i
            while j > 0 && a[j] < a[j-1]
            {
                temp = a[j]
                a[j] = a[j-1]
                a[j-1] = temp
                j -= 1
            }
        }
        return a
    }
    
    //MARK: - Quick Sorts
    func quickSortBasic(array: [Int]) -> [Int]
    {
        var a = array
        let len = a.count
        guard len > 1 else
        {
            return a
        }
        let pivot = a[len / 2]
        let lesserNumbers = a.filter{$0 < pivot}
        print("\(lesserNumbers)")
        let equalNumbers = a.filter{$0 == pivot}
        print("\(equalNumbers)")
        let greaterNumbers = a.filter{$0 > pivot}
        print("\(greaterNumbers)")
        return quickSortBasic(array: lesserNumbers) + equalNumbers + quickSortBasic(array: greaterNumbers)
    }
    
    
}
