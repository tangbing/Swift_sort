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
        var aray = [4, 1, 2, 5, 0]
        let resultForNum = selectSourt(&aray)
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



}

