//
//  Engine.swift
//  Assignment3
//
//  Created by Nikita Mirolyubov on 02.07.16.
//  Copyright © 2016 MacBookPro. All rights reserved.
//

import Foundation

func step (beforeArray:[[Bool]]) -> [[Bool]] {
    
    //declaring AFTER array
    
    let afterArray = TwoDimensional (columns: beforeArray.count, rows: beforeArray.count)
    let rows = beforeArray.count
    let columns = beforeArray.count
    
    
    
    
    var aliveNeighbours = 0
    for col in 0..<columns{
        for row in 0..<rows{
            
            let coordinatesOfNeighbours = step2((row, col), columns: columns, rows: rows) //get the coordinates of neighbours
            
            for neighbours in coordinatesOfNeighbours {
                if beforeArray[neighbours.0][neighbours.1] {
                    aliveNeighbours+=1
                }
            }
            
            switch aliveNeighbours {
                
            case 0..<2 : afterArray.twoDimensionalArray [row][col] = false
                
            case 3 : afterArray.twoDimensionalArray [row][col] = true
            case 2: let a = (beforeArray[row][col])
                if (!a){
                afterArray.twoDimensionalArray [row][col] = false
            } else {afterArray.twoDimensionalArray [row][col] = true}
                
            default : afterArray.twoDimensionalArray [row][col] = false
            }
            aliveNeighbours = 0
            
            
        }
    }
    
    
    return afterArray.twoDimensionalArray
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
// for some unknown reasons step 2 func is needed to execute func neighbours which seems pointless
func step2 (coordinates:(Int,Int), columns:Int, rows: Int) -> [(Int,Int)]{
    let row = coordinates.0
    let col = coordinates.1
    let coordinatesOfNeighbours = neighbours((row, col), columns: columns, rows: rows)
    return coordinatesOfNeighbours
}
func neighbours(coordinates:(Int,Int), columns:Int, rows: Int) -> [(Int,Int)] {
    let row = coordinates.0
    let col = coordinates.1
    
    let previousRow:Int = (row + rows-1) % rows
    let nextRow:Int = (row+1)%rows
    let previousCol:Int = (col + columns-1) % columns
    let nextCol:Int = (col+1) % columns
    let coordinatesOfNeighbours = [(row,nextCol),(row,previousCol),(nextRow, nextCol),(nextRow, previousCol),(previousRow,previousCol),(previousRow,col),(previousRow,nextCol),(nextRow,col)]
    return coordinatesOfNeighbours
}


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

