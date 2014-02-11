headerString = '<!DOCTYPE html>\n
<html>\n
<head>\n
    <title>Grade Point Average Calculator</title>\n
</head>\n
<body>\n'


formString = '<form method="post" action="/gpa">\n<label>Grade: </label>\n
              <input type="text" name="grade1" value="" width="5"/>\n
              <select name="credit1">\n<option>1</option>\n<option>2</option>\n
              <option>3</option>\n<option>4</option>\n<option>5</option>\n</select><br />\n<label>Grade: </label>\n
              <input type="text" name="grade2" value="" width="5"/>\n
              <select name="credit2">\n<option>1</option>\n<option>2</option>\n
              <option>3</option>\n<option>4</option>\n<option>5</option>\n</select><br />\n
              <label>Grade: </label>\n<input type="text" name="grade3" value="" width="5"/>\n
              <select name="credit3">\n<option>1</option>\n<option>2</option>\n
              <option>3</option>\n<option>4</option>\n<option>5</option>\n</select><br />\n
              <label>Grade: </label>\n<input type="text" name="grade4" value="" width="5"/>\n
              <select name="credit4">\n<option>1</option>\n<option>2</option>\n
              <option>3</option>\n<option>4</option>\n<option>5</option>\n</select><br />\n</form> '


footerString = '</body>\n</html>'


#gpa functions
letterToPercent = (letter) ->
  switch letter
    when "A" then 1
    when "A-" then .93
    when "B+" then .89
    when "B" then .86
    when "B-" then .82
    when "C+" then .79
    when "C" then .76
    when "C-" then .72
    when "D+" then .69
    when "D" then .66
    when "D-" then .62
    else 0


percentCredit = (letter, cred) ->
  letterToPercent(letter) * cred

makeGPA = (g1, g2, g3, g4) ->
  gradeSum = g1 + g2 + g3 + g4
  gradeSum = gradeSum / 4
  gradeSum = gradeSum * 100
  gradeSum = Math.round(gradeSum)
  return gradeSum / 100

module.exports.letterToPercent = letterToPercent
module.exports.percentCredit = percentCredit
module.exports.makeGPA = makeGPA

exports.formResponse = (req, res) ->
  res.render = 'gpa'

exports.postResponse = (req, res) ->
  g1 = percentCredit(req.body.grade1, req.body.credit1)
  g2 = percentCredit(req.body.grade2, req.body.credit2)
  g3 = percentCredit(req.body.grade3, req.body.credit3)
  g4 = percentCredit(req.body.grade4, req.body.credit4)
  GPA = makeGPA(g1, g2, g3, g4)
  res.send headerString + formString + '<p>Your GPA Is ' + GPA + '</p>' + footerString