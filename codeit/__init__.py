from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_login import LoginManager
from flask_moment import Moment

app = Flask(__name__)
app.config['SECRET_KEY'] = '60ba11abf2de9ed6d6495f367b3d65d2'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/codeit'
moment=Moment(app)
db = SQLAlchemy(app)
bcrypt=Bcrypt(app)
login_manager=LoginManager(app)
login_manager.login_view='login'
login_manager.login_message_category='info'

from codeit import routes