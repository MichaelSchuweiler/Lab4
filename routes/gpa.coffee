formString = '<form method="post" action="/gpa">\n<label>Grade: </label>\n
              <input type="text" id="grade1" value="" width="5"/>\n
              <select id="credit1">\n<option>1</option>\n<option>2</option>\n
              <option>3</option>\n<option>4</option>\n<option>5</option>\n</select><br />\n<label>Grade: </label>\n
              <input type="text" id="grade2" value="" width="5"/>\n
              <select id="credit2">\n<option>1</option>\n<option>2</option>\n
              <option>3</option>\n<option>4</option>\n<option>5</option>\n</select><br />\n
              <label>Grade: </label>\n<input type="text" id="grade3" value="" width="5"/>\n
              <select id="credit3">\n<option>1</option>\n<option>2</option>\n
              <option>3</option>\n<option>4</option>\n<option>5</option>\n</select><br />\n
              <label>Grade: </label>\n<input type="text" id="grade4" value="" width="5"/>\n
              <select id="credit4">\n<option>1</option>\n<option>2</option>\n
              <option>3</option>\n<option>4</option>\n<option>5</option>\n</select><br />\n</form> '

headerString = '<!DOCTYPE html>\n
<html>\n
<head>\n
    <title>Grade Point Average Calculator</title>\n
</head>\n
<body>\n'

footerString = '</body>\n</html>'

exports.formResponse = (req, res) ->
  res.render = 'gpa'

exports.postResponse = (req, res) ->
  g1 = percentCredit(req.getElementById("grade1").value, req.getElementById("credit1").value)
  g2 = percentCredit(req.getElementById("grade2").value, req.getElementById("credit2").value)
  g3 = percentCredit(req.getElementById("grade3").value, req.getElementById("credit3").value)
  g4 = percentCredit(req.getElementById("grade4").value, req.getElementById("credit4").value)
  GPA = makeGPA(g1, g2, g3, g4)
  res.send headerString + formString + '<p>Your GPA Is ' + GPA + '</p>' + footerString

#gpa functions

letterToPercent = (letter) ->
  if (letter is "A")
    return .100
  else
    if (letter is "A-")
      return .93
    else
      if (letter is "B+")
        return .89
      else
        if (letter is "B")
          return .86
        else
          if (letter is "B-")
            return .82
          else
            if (letter is "C+")
              return .79
            else
              if (letter is "C")
                return .76
              else
                if (letter is "C-")
                  return .72
                else
                  if (letter is "D+")
                    return .69
                  else
                    if (letter is "D")
                      return .66
                    else
                      if (letter is "D-")
                        return .62
                      else
                        if (letter is "F")
                          return .6

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