//
//  ViewController.swift
//  arithmetic
//
//  Created by Xianxiangdaishu on 2019/6/3.
//  Copyright © 2019 XXDS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sortArray = [1,9,7,8,4,6,3,2,1,46,34,789,23]
//    var sortArray = [1,9,7,8,4]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        第i层 最多  2^(i-1)个元素
//        第i - 1层之前的所有元素为 2^(i-1) - 1个元素
//        堆排序
//        heapSort()
        
//        归并p排序
//        mergeSort(first: 0, end: sortArray.count - 1)
//        快排
//        qiuckSort()
//        希尔排序
//        hillSort()
//        冒泡排序
//        bubbleSort()
//        选择排序
//        selectSort()
//        插入排序
        insertionSort()
        for (index, value) in sortArray.enumerated() {
            
            print("index= \(index) value= \(value)")
        }
        
        

    }

    func heapSort()  {
        
        for i in (0...(sortArray.count/2)).reversed() {
            
            makeMiniHeap(i: i, n: sortArray.count )
        }
        var  temp = 0
        
        for i in (0..<sortArray.count).reversed() {
            
            temp = sortArray[0]
            sortArray[0] = sortArray[i]
            sortArray[i] = temp
            makeMiniHeap(i: 0, n: i)

        }
    }
    
    func makeMiniHeap(i: Int, n: Int) {
        
        var j = 2*i + 1
        var temp: Int
        var ii = i
        
        while j < n {
            
            //在左右子节点中寻找最小的
            while j + 1 < n && sortArray[j + 1] < sortArray[j] {
                
                j += 1;
            }
//            i和j对应的值相比
            if sortArray[ii] <= sortArray[j] {
                
                break
            }
            //较大节点下移
            temp = sortArray[ii]
            sortArray[ii] = sortArray[j]
            sortArray[j] = temp
//           一直向下执行
            ii = j
            j = 2*ii + 1
        }
    }
    
    
    func mergeSort(first: Int, end: Int )  {
        
        if first < end {
            
//          紧挨的两个数就不会递归调用了 比如 0 - 1 ， 第一个表达式 = 0 ，向下执行就是 0 - 0， 1 - 1
            let mm = (first + end) / 2
             mergeSort(first: first, end:mm )
             mergeSort(first: mm + 1, end:end )
             mergeArray(first: first, middle: mm, end: end)
        }
    }
    
    func mergeArray(first: Int,middle: Int, end: Int)  {
        
        var i = first
        let m = middle
        
        var j = middle + 1
        let e = end
        
        
        var tempArray = [Int]()

//        1，9 -- 7，8
        while i <= m && j <= e  {
            
            if sortArray[i] <= sortArray[j] {
                tempArray.append(sortArray[i])
                i += 1
                
            } else {
                tempArray.append(sortArray[j])
                j += 1
                
            }
        }
            while i <= m {
                
                tempArray.append(sortArray[i])
                i += 1

            }
            while j <= e {
                
                tempArray.append(sortArray[j])
                j += 1
            }
            
            
            for ii in 0..<tempArray.count {
                
                sortArray[first + ii] = tempArray[ii]
            }
    
        
    }
    
    
    func qiuckSort() {
    
        
      makeQiuckSort(first: 0, end: sortArray.count - 1)
    }
    
    func makeQiuckSort(first: Int, end: Int)  {
        
        if first >= end {
            
            return
        }
        
        var i = first
        var j = end
        var key = sortArray[i]
        
        while i < j {
//            找到第一个小于key的数值
            while i < j && sortArray[j] > key {
                j -= 1
            }
            if i < j {
                
              sortArray[i] = sortArray[j]
              i += 1
            }
//            找到第一个大于key的数值
            while i < j && sortArray[i] <= key {
                
                i += 1
            }
            if i < j {
                
                sortArray[j] = sortArray[i]
                j -= 1
            }
        }
        
        sortArray[i] = key
        makeQiuckSort(first: 0, end: i - 1)
        makeQiuckSort(first: i + 1, end: end)
    }

    
    
    func hillSort() {
       
        var mm: Int = sortArray.count
        
        while true  {

            mm = mm/2
            for i in stride(from: 0, to: mm, by: 1) {
                for ii in stride(from: i + mm, to: sortArray.count, by: mm) {
                    innerloop:

                    for j in stride(from: ii, through: 0, by: -mm)  {
                        
                        
                        if j - mm > 0 {
                            
                            if sortArray[j] < sortArray[j - mm] {
                                
                                let temp = sortArray[j - mm]
                                sortArray[j - mm] = sortArray[j]
                                sortArray[j] = temp
                                
                            } else {
                                
                                break innerloop;
                            }

                        }
                    }
                    
                }
            }

            if mm == 1 {
                
                break
            }
            
            
        }
    }
    
    func bubbleSort() {
        
        var flag = 0
        
        for _ in 0..<sortArray.count - 1  {
            
            for j in 0..<sortArray.count - 1 {
                
                if sortArray[j ] > sortArray[j + 1] {
                    
                   let temp = sortArray[j + 1]
                    sortArray[j + 1] = sortArray[j]
                    sortArray[j ] = temp
                    flag = 1
                }
            }
            
            if flag == 0 {
                
                break
            }
        }
    }
    
    func selectSort() {
    
        for i in 0..<sortArray.count - 1  {
            
            var mm = i
            
            for j in (i+1)..<sortArray.count  {

//                注意mm的值的改变
                if sortArray[mm] > sortArray[j]{
                    
                    mm = j
                }
            }
            
            let temp = sortArray[i]
            sortArray[i] = sortArray[mm]
            sortArray[mm] = temp

        }
    }
    
    func insertionSort()  {
        
        for i in 1..<sortArray.count  {
            
            var  mm = i
            
            for j in (0..<i).reversed()  {

                if sortArray[mm] < sortArray[j] {
//                  注意mm值的g改变
                    let temp = sortArray[mm]
                    sortArray[mm] = sortArray[j]
                    sortArray[j] = temp
                    
                    mm = j

                } else {
                    break
                }
            }
            
            
        }
    }
    
    
    @IBAction func onClick(_ sender: UIButton) {
        
//        UIApplication.shared.open(<#T##url: URL##URL#>, options: [UIApplication.OpenExternalURLOptionsKey : Any], completionHandler: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        if #available(iOS 10.0, *) {
//            UIApplication.shared.open(URL.init(string: "vidyomobile://")!)
//            UIApplication.shared.open(URL.init(string: "vidyomobile://")!, options: [UIApplication.OpenExternalURLOptionsKey.init(rawValue: "123") : "123"], completionHandler: nil)
        } else {
            // Fallback on earlier versions
        }
        
        UIApplication.shared.openURL(URL.init(string: "vidyomobile://")!)
        
        
    }
    
    
}



