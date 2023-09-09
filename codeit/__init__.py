import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bcrypt import Bcrypt
from flask_login import LoginManager
from flask_moment import Moment
from flask_mail import Mail
from dotenv import load_dotenv

load_dotenv()

app = Flask(__name__)
app.config['SECRET_KEY'] = '60ba11abf2de9ed6d6495f367b3d65d2'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost/codeit'
moment=Moment(app)
db = SQLAlchemy(app)
bcrypt=Bcrypt(app)
login_manager=LoginManager(app)
login_manager.login_view='login'
login_manager.login_message_category='info'

app.config['MAIL_SERVER'] = 'smtp.googlemail.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USERNAME'] = os.environ.get('EMAIL_USER')
# app.config['MAIL_USERNAME'] ='codeit.step@gmail.com'
app.config['MAIL_PASSWORD'] = os.environ.get('EMAIL_PASS')
# app.config['MAIL_PASSWORD'] = 'tjazfuizekmuhqqj'
mail = Mail(app)

from codeit import routes