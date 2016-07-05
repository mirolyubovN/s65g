//: Playground - noun: a place where people can play

import Foundation

let immutableString = "Hello, playground" //immutable variables can not be changed; they are like constants
var str = "Hello, playground"// var are mutable; can be assigned another value

str = "another sring"

var myInt = 42
let myConstant = 50

let implicitDouble = 70.0
let explicitDouble: Double = 70 // this is a type declaration; if you want this to be and int, then change to : int = 70

let label = "the width is"
let width = 94
let widthLabel = label + " " + String(width) //object casting reference


let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples. "
let orangeSummary = "I have \(oranges) oranges. "


var shoppingList = ["catfish", "water", "oranges", "blue paint"] //creating an array of Strings; arrays are TYPED (they must be of a type)
shoppingList.append("toothpaste") //adding an element to an existing array
//shoppingList.append (47) //causes compile error





var newshoppingList: Array<Any> = ["catfish", "water", "oranges", "blue paint", 47] //creating an array of type ANY; not neccesary to put ": Array<Any>"

var copyList = newshoppingList

newshoppingList.append("toothpaste") //adding an element to an existing array
newshoppingList.append (47) // does not cause a compile error

copyList //all changes made to newshoppinglist do not affect copyList as it is being passed by value




var occupation:Dictionary <String, String> = [  //it is a DICTIONARY
    "malcolm": "capitan",
    "kalyee": "machanic"
]

occupation ["jayne"] = "Public Relations"
occupation

//var names = occupation.map(<#T##transform: ((String, String)) throws -> T##((String, String)) throws -> T#>) //map is a function taking a single argument (transform) and returning argument of type T

var occupationNames = occupation.map { (k:String, v:String) -> String in //returns a string this time
    return k
}
occupationNames

var newOccupationNames = occupation.map {$0.0}.map {$0; "blah"}

newOccupationNames







/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


var r = 50...100 //creating a range of integers ; useful for arrays
var g = r.generate()
g.next()
g.next()
g.next()


var g1 = [11,21,31,41,51].generate()
g1.next()
g1.next()

var tuple1 = (1,2)
tuple1.0
tuple1.1


var tuple2 = (first: "Nikita" , second: "Mirolyubov")
tuple2.0
tuple2.1

tuple2.first
tuple2.second


for (k,v) in occupation {
print("\(k), \(v)")
}

func doubler(x:Int) -> Int {
    
    return x*2
}

func doubleDoubler(x:Double) -> Double {
    
    return x*2
}

doubler(2)
doubleDoubler(3)


func progression (v:Int,f:Int->Int) ->Int { //-> specifies return type of a FUCTION, so everytime see -> - IT IS A FUNCTION
    return f(v)
}

progression(4, f: doubler)
//progression(3, f: doubleDoubler)//wrong type of function so COMPILE ERROR


var tf = false
tf = true
tf

var arrArr: Array<Array<Bool>> = [[true]] // 2 d array (array of arrays)

var dictionaryArr: Array<Dictionary<Int,Bool>> = [[1:true]] //array dictionaries

var closure = { (x:Int) -> Int in
    return x*2
}                                   // its a closure 



closure (6) //variable
progression(6, f: closure)//function


progression(6) { (x:Int) -> Int in
    return x*2
}                                //putting a closure instead of a reference to it




progression(6, f:{ (x:Int) -> Int in
    return x*2
})                               //SAME AS THE TOP ONE


var noValueString:String? = nil // has no value, but could be a String; it can either be a String or nothing (null (nil))
//its an "optional" variable

var noValueInt:Int? = 14
var implicitOptionalN:Int! = 12


//doubler(noValueInt)//error

if let n = noValueInt {
    let dobuleN = doubler(n)
}

doubler(implicitOptionalN)





























