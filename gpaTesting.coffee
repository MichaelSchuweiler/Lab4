assert = require 'assert'
letterToPercent = require('./routes/gpa').letterToPercent






describe "testing letterToPercent", ->
  it "should change an A- to a 93%", ->
    assert.equal(letterToPercent("A-"), .93)
  it "should change a D+ to a 69%", ->
    assert.equal(letterToPercent("D+"), .69)
