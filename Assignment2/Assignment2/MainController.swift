//
//  ViewController.swift
//  Assignment2
//
//  Created by Nikita Mirolyubov on 29.06.16.
//  Copyright © 2016 MacBookPro. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Test"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
class Problem2ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Problem2"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBOutlet weak var textView2: UITextView!
    @IBAction func runButton2(sender: UIButton) {
        //textView2.text = "I am working!"
        
        
        //creating arrays
        let beforeArray = TwoDimensional (columns: 10, rows: 10) //if the size of the grid is needed to be changed - this is the only place where it should be done
        let afterArray = TwoDimensional (columns: beforeArray.columnsMax, rows: beforeArray.rowsMax)

       

        
        afterArray.twoDimensionalArray = step(beforeArray.twoDimensionalArray) //getting the value of afterarray by executing step
        
        textView2.text = "There are \(countAliveCells(beforeArray.twoDimensionalArray, rows: beforeArray.rowsMax, columns: beforeArray.columnsMax)) cells initially alive\n There are \(countAliveCells(afterArray.twoDimensionalArray, rows: afterArray.rowsMax, columns: afterArray.columnsMax)) cells alive after"
        
        //this print method is just to test the whole code and see if everything is working as it should
        print(beforeArray.prettyPrint(beforeArray.twoDimensionalArray))
        print(afterArray.prettyPrint(afterArray.twoDimensionalArray))
    

    }
    //function for counting living cells
    func countAliveCells (beforeArray:[[Bool]], rows:Int, columns:Int)-> Int {
        var aliveCells: Int = 0
        for col in 0..<columns{
            for row in 0..<rows{
                if beforeArray[row][col]{
                    aliveCells += 1
                }
            }
        }
        return aliveCells
        
    }
    
    
    
}



class Problem3ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Problem3"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var textView3: UITextView!
    @IBAction func runButton3(sender: UIButton) {
        textView3.text = "I am working!"
    }
    
    
}

class Problem4ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Problem4"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var textView4: UITextView!
    @IBAction func runButton4(sender: UIButton) {
        textView4.text = "I am also working!"
        
    }
    
}

//the code below is a modified version of the code provided by JP

typealias LifeGrid = [[Bool]]

class TwoDimensional {
    let columnsMax : Int
    let rowsMax : Int
    var twoDimensionalArray : LifeGrid
    
   
    init(columns: Int, rows: Int) {
        // Validate the inputs
        if (columns < 0) {
            columnsMax = 0
        } else {
            columnsMax = columns
        }
        
        if (rows < 0) {
            rowsMax = 0
        } else {
            rowsMax = rows
        }
        
        
        twoDimensionalArray = Array(count: rowsMax, repeatedValue: Array(count: columnsMax,repeatedValue: false))
        
      
        // Set it to a random value, 1/3 should be true
        for col in 0..<columnsMax{
            for row in 0..<rowsMax{
                let check = Int(arc4random_uniform(3))
                if check==1 {
                    twoDimensionalArray[row][col] = true
                }
                else{
                    twoDimensionalArray[row][col] = false
                }
                
            }
        }
    }
    func prettyPrint(lifeGrid: LifeGrid) -> String {
        let derivedColumns = lifeGrid.count
        let derivedRows : Int
        
        if (derivedColumns == 0) {
            derivedRows = 0
        } else if let firstElement = lifeGrid.first {
            derivedRows = firstElement.count
        } else {
            // Should never happen, but belt and suspendering to catch any logical failures.
            print("lifeGrid: <\(lifeGrid)>")
            derivedRows = 0
        }
        
        var prettyPrintLog = "[\(derivedColumns)x\(derivedRows)]\n"
        for intArray in lifeGrid {
            for intValue in intArray {
                prettyPrintLog += "\(intValue) "
            }
            prettyPrintLog += "\n"
        }
        
        return prettyPrintLog
    }
}

//This code was used in problem 2 to calculate the number of living neighbours and determine the state of the cell in the next itteration. The code was embedded inside  @IBAction func in problem 2. 
/*var previousRow = (row + rows-1) % rows
 var nextRow = (row+1)%rows
 var previousCol = (col + columns-1) % columns
 var nextCol = (col+1) % columns
 
 //checking for living neighbors
 if beforeArray[row][nextCol]{
 aliveNeighbours+=1
 }
 if beforeArray[nextRow][nextCol]{
 aliveNeighbours+=1
 }
 if beforeArray[nextRow][col]{
 aliveNeighbours+=1
 }
 if beforeArray[row][previousCol]{
 aliveNeighbours+=1
 }
 if beforeArray[previousRow][nextCol]{
 aliveNeighbours+=1
 }
 if beforeArray[previousRow][previousCol]{
 aliveNeighbours+=1
 }
 if beforeArray[nextRow][previousCol]{
 aliveNeighbours+=1
 }
 
 if beforeArray[previousRow][col]{
 aliveNeighbours+=1
 
 
 
 switch aliveNeighbours {
 
 case 0..<2 : afterArray [row][col] = false
 
 case 2,3 : afterArray [row][col] = true
 
 default : afterArray [row][col] = false
 }
 aliveNeighbours = 0
 }*/

