from urllib.parse import parse_qs
# https://zrej4m4d08.execute-api.us-east-2.amazonaws.com/test/pyculator - Link
def lambda_handler(event, context):
    print(event)
    http_method = event['httpMethod']
    
    if http_method == 'POST':
        # Parse the form data from the request body
        form_data = parse_qs(event['body'])
        
        # Extract the values for the op, var1, and var2 parameters
        op = form_data['op'][0]
        var1 = int(form_data['var1'][0])
        var2 = int(form_data['var2'][0])
        
        # Perform the desired operation on the var1 and var2 values
        if op == 'Addition':
            result = var1 + var2
        elif op == 'Substraction':
            result = var1 - var2
        elif op == 'Division':
            result = var1 / var2
        elif op == 'Multiplication':
            result = var1 * var2
        elif op == 'Modulo':
            result = var1 % var2
        else:
            result = 'Invalid operation'

        # Construct a response message with the result of the operation
        content ="""
        <html>
         <pre> 
         ____________________________
        |  ________________________  |
        | |                        | |
        | | """ + f'{result:>23.3f}' + """| |
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
        <form method="POST" action="https://zrej4m4d08.execute-api.us-east-2.amazonaws.com/test/pyculator/">
        <input type="text" name="op" list="operations" placeholder="operation">
            <datalist id="operations">
              <option value="Addition">
              <option value="Substraction">
              <option value="Division">
              <option value="Multiplication">
              <option value="Modulo">
            </datalist>
        <div style="display: inline-block;">
          <input type="text" name="var1" placeholder="Variable 1">
          <input type="text" name="var2" placeholder="Variable 2">
          <input type="submit" value="Calculate">
        </div>
        </form>
        </html>
        """
        response = {
            'statusCode': 200,
            'headers': {
                'Content-Type': 'text/html'
            },
            'body': content
        }
    else:
        # Serve the initial HTML form
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
        <form method="POST" action="https://zrej4m4d08.execute-api.us-east-2.amazonaws.com/test/pyculator/">
        <input type="text" name="op" list="operations" placeholder="operation">
            <datalist id="operations">
              <option value="Addition">
              <option value="Substraction">
              <option value="Division">
              <option value="Multiplication">
              <option value="Modulo">
            </datalist>
        <div style="display: inline-block;">
          <input type="text" name="var1" placeholder="Variable 1">
          <input type="text" name="var2" placeholder="Variable 2">
          <input type="submit" value="Calculate">
        </div>
        </form>
        </html>
        """
        response = {
            'statusCode': 200,
            'headers': {
                'Content-Type': 'text/html'
            },
            'body': content
        }

    return response