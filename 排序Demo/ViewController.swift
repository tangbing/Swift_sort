//
//  ViewController.swift
//  排序Demo
//
//  Created by Tb on 2021/4/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        let aray = [4, 1, 2, 5, 0]
        let resultForNum = mergeSort(aray)
        print(resultForNum)
        
        
    }
    
    // 冒泡排序
    func sortNum(_ array: inout [Int]) -> [Int] {
        var temp = 0
        for i in 0..<array.count {
            for j  in 0..<array.count {
                if array[j] > array[i] {
                    temp = array[i]
                    array[i] = array[j]
                    array[j] = temp
                }
            }
        }
        return array
    }

    
    // 直接插入排序
    /*
     直接从第一个开始插入，从后往前比较，如果小于，则依次往后移动
     */
    func insertSourt(_ array: inout [Int]) -> [Int] {
        
        var temp = 0;
        for i in 1..<array.count {
            temp = array[i]
            
            for j in stride(from: i, to: 0, by: -1)  {
                if temp < array[j - 1]   {
                    array[j] = array[j-1]
                    array[j-1] = temp
                } else {
                    break
                }
            }
        }
        return array
    }
    
    //0 [0, 1, 2, 5, 4]
    //1 [0, 1, 2, 5, 4]
    //2 [0, 1, 2, 5, 4]
    //3 [0, 1, 2, 4, 5]

    // 选择排序
    func selectSourt(_ array: inout [Int]) -> [Int] {
        
        for i in 0..<array.count {
            var min = i
            for j in i + 1 ..< array.count {
                if array[j] < array[min]  {
                    min = j
                }
            }
            
            if i != min {
                array.swapAt(i, min)
            }
        }
       return array
    }
    
    
    func _merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
        
        print("\nmerge left pile:\(leftPile)  |  right pile:\(rightPile)")

        var leftIndex = 0
        var rightIndex = 0
        
        var sortedPile = [Int]()
        
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            if leftPile[leftIndex] < rightPile[rightIndex] {
                sortedPile.append(leftPile[rightIndex])
            } else if leftPile[leftIndex] > rightPile[rightIndex] {
                sortedPile.append(rightPile[rightIndex])
            } else {
                sortedPile.append(leftPile[leftIndex])
                leftIndex += 1
                sortedPile.append(rightPile[rightIndex])
                rightIndex += 1
            }
        }
        
        while leftIndex < leftPile.count {
            sortedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightPile.count {
            sortedPile.append(rightPile[rightIndex])
            leftIndex += 1
        }
        print("sorted pile：\(sortedPile)")
        return sortedPile
    }
    func mergeSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else {
            return array
        }
        let middleIndex = array.count / 2
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[0..<middleIndex]))

        return _merge(leftPile: leftArray, rightPile: rightArray)
        
    }
    



}

