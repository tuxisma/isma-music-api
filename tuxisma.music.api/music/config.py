import os
import sys

def initial_configuration(app):

    if 'FLASK_CONFIG' in os.environ:
        app.config.from_pyfile(os.environ.get('FLASK_CONFIG'))
    