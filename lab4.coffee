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

describe "testing splicing", ->
  it "should change all numbers in the given indices to 864", ->
    assert.deepEqual(turnTo864(arr5, 3, 6), testArr3)


person = {name: n, DOB: dob }

{name: x, DOB: y} = person

[x, y] = ["John", "07/10/1980"]


personArr = (person) ->
  arr = [person.x, person.y]
  return arr

describe "testing printPerson", ->
  it "should print the person's name and DOB", ->
    assert.deepEqual(personArr(person1), testPersonArr)