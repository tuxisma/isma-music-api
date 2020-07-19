import os
import sys

os_path_file = os.path.dirname(__file__)

sys.path.append(os_path_file)

from music import app

app.run(debug=True, host='0.0.0.0', port=5001)
