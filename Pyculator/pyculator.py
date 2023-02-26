#1. Show options and data input


def lambda_handler(event, context):
    content = """
    <html>
 <pre> 
 ____________________________
|  ________________________  |
| |                        | |
| |           80085        | |
| |________________________| |
|  ___ ___ ___   ___   ___   |
| | 7 | 8 | 9 | | + | | % |  |
| |___|___|___| |___| |___|  |
| | 4 | 5 | 6 | | - | | H |  |
| |___|___|___| |___| |___|  |
| | 1 | 2 | 3 | | x |        |
| |___|___|___| |___|        |
| | . | 0 | = | | / |        |
| |___|___|___| |___|        |
|____________________________|
</pre>
<form method="POST" action="http://example.com/submit">
<input type="text" name="op" list="operations" placeholder="operation">
    <datalist id="operations">
      <option value="Addition">
      <option value="Substraction">
      <option value="Division">
      <option value="Multiplication">
      <option value="Modulo">
    </datalist>
<div style="display: inline-block;">
  <input type="text" placeholder="Variable 1">
</div>
<div style="display: inline-block;">
  <input type="text" placeholder="Variable 2">
</div>
<button type="submit">Submit</button>
   </form>
</html>
    """
    response = {
        "statusCode": 200,
        "body": content,
        "headers": {"Content-type" : "text/html",},
        }
    return response




#2. Get data from frontend






#3. Validate data





#4. Do calculations based on input



#5. Return formated output