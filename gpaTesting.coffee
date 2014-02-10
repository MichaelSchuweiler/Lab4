assert = require 'assert'
letterToPercent = require('./routes/gpa').letterToPercent
percentCredit = require('./routes/gpa').percentCredit





describe "testing letterToPercent", ->
  it "should change an A- to a 93%", ->
    assert.equal(letterToPercent("A-"), .93)
  it "should change a D+ to a 69%", ->
    assert.equal(letterToPercent("D+"), .69)

describe "testing percentCredit", ->
  it "should give 3.72 for an A- in a 4 credit course", ->
    assert.equal(percentCredit("A-", 4), 3.72)
  it "should give 1.38 for a D+ in a 2 credit course", ->
    assert.equal(percentCredit("D+", 2), 1.38)

describe "testing makeGPA", ->
  it "should give __ for a 3.72, 1.38, 2.57, and 4.0"