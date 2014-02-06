assert = require 'assert'

arr = [1, 2, 3, 4, 5]
testArr = [4, 5, 6, 7, 8]

add3 = (x) -> x + 3

addToArray = (arr) ->
 add3 num for num in arr

describe "testing addToArray", ->
 it "should add 3 to each number in the array", ->
   assert.deepEqual(addToArray(arr), testArr)


arr1 = ["this ", "is ", "an ", "array"]
string1 = "this is an array"
string = ""

addToString = (str) ->
  string += str
  return string

arrToString = (arr) ->
  addToString str for str in arr
  return string

describe "testing arrToString", ->
  it "should take the contents of the array and make it one string", ->
    assert.equal(arrToString(arr1), string1)

arr2 = [2, 12, 15, 20, 1, 3]
testBoolArr = [false, true, true, true, false, false]

greaterThanTen = (x) ->
  if x > 10
     yes
    else
     no

greaterThan10 = (arr) ->
  greaterThanTen num for num in arr

describe "testing greaterThan10", ->
  it "should check if each number in the array is greater than 10 and return an array replacing each number with true or false", ->
    assert.deepEqual(greaterThan10(arr2), testBoolArr)


arr3 = [1, 2, 3, 4, 5, 6]
testHalf = [1, 2, 3]

halfRange = (arr) ->
  half = arr.length / 2 - 1
  arr[0..half]

describe "testing ranges", ->
  it "should return the first half of an array", ->
    assert.deepEqual(halfRange(arr3), testHalf)

arr4 = [1..6]
testArr2 = [1, 6]

firstAndLast = (arr) ->
  last = arr.length - 1
  arr[1...last] = []
  return arr

describe "testing slicing", ->
  it "should remove all of an array except the first and last", ->
    assert.deepEqual(firstAndLast(arr4), testArr2)

arr5 = [0, 1, 2, 3, 4, 5, 6]
testArr3 = [0, 1, 2, 864, 864, 864, 6]

turnTo864 = (arr, x, y) ->
  arr[x..y] = [864, 864, 864]
  arr

describe "testing splicing", ->
  it "should change all numbers in the given indices to 864", ->
    assert.deepEqual(turnTo864(arr5, 3, 5), testArr3)


arr6 = [0, 1, 2, 3, 4, 5]
testArr4 = [0, 1, 7, 3, 4, 5]

add7 = (arr) ->
  middle = arr.length / 2 - 1
  arr[middle] = 7
  arr

describe "testing splicing", ->
  it "should replace the middle index (rounded down) to 7", ->
    assert.deepEqual(add7(arr6), testArr4)


arr7 = [0, 1, 2, 3, 4]
arr8 = [9, 10, 11]
testArr5 = [0, 1, 9, 10, 11, 3, 4]


insertArr = (arr1, arr2, i) ->
  arr1[i..i] = arr2
  arr1

describe "testing splicing", ->
  it "should replace given index in an array with another array", ->
    assert.deepEqual(insertArr(arr7, arr8, 2), testArr5)

testingEqual = (x, y) ->
  if x is y
     yes
    else
     if x isnt y
       false

describe "testing alias2", ->
  it "should do the same as above", ->
    assert.equal(testingEqual(7, "hello"), false)


describe "testing alias", ->
  it "should test if two objects are equal", ->
    assert.equal(testingEqual(7, 7), true)


testExistance = (x) ->
  if x?
     yes
    else
     no


describe "testing existential", ->
  it "should test if an object exists", ->
    assert.equal(testExistance(arr), true)
    assert.equal(testExistance(), false)
    assert.equal(testExistance(testingEqual), true)

arr9 = [1, 2, 3]
testArr6 = [3, 2, 1]
arr10 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
testArr7 = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
arr11 = []
testArr8 = []

switchingIndex = (arr) ->
  arrThis = [arr[0]..arr[arr.length - 1]]
  arrThat = [arr[arr.length - 1]..arr[0]]
  arrThis = arrThat
  arrThis

describe "testing destructuring", ->
  it "should turn reverse the arrays", ->
    assert.deepEqual(switchingIndex(arr9), testArr6)
    assert.deepEqual(switchingIndex(arr10), testArr7)
    assert.deepEqual(switchingIndex(arr11), testArr8)


t1 = ["start"]
m1 = ["stuff", "inside", "this", "array"]
b1 = ["end"]
testArr9 = [["start"], ["stuff", "inside", "this", "array"], ["end"]]

testArr10 = [[], [], []]
testArr11 = [[7], [], [10]]

createTheArray = (t, m..., b) ->
  arr = [t, m..., b]

describe "testing splats", ->
  it "should make an array of top, middle, and bottom. where top and bottom are 1 item and middle has no limit", ->
    assert.deepEqual(createTheArray(t1, m1, b1), testArr9)
    assert.deepEqual(createTheArray([], [], []), testArr10)
    assert.deepEqual(createTheArray([7], [], [10]), testArr11)
