from flask import Flask
from .config import initial_configuration

app = Flask(__name__, instance_relative_config=True)
initial_configuration(app)


from . import routes
