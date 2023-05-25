from flask import Flask,render_template,session,request,redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
import os

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

app= Flask(__name__,template_folder='templates')
app.config['SQLALCHEMY_DATABASE_URI']= params['local_uri']
db=SQLAlchemy(app)

app.secret_key = 'super-secret-key'

class posts(db.Model):
    Sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(20), nullable=False)
    slug = db.Column(db.String(30), nullable=False)
    content = db.Column(db.String(500), nullable=False)
    datetime = db.Column(db.String, nullable=True)

@app.route("/")
@app.route("/index",methods=['GET'])
def home():
    pos = posts.query.filter_by().all()[0:params['no_of_posts']]
    return render_template('index.html',params=params,post=pos)

@app.route("/post/<string:post_slug>",methods=['GET'])
def post(post_slug):
    pos=posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html',params=params,post=pos)

# @app.route("/admin",methods=['POST'])
# def admin():
#     return render_template('admin.html',params=params)
@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/admin')

@app.route("/admin",methods=['GET','POST'])
def admin():
    if "user" in session and session['user'] == params['admin_user']:
        post = posts.query.all()
        return render_template('admin.html', params=params, post=post)

    if request.method == "POST":
        username = request.form.get("uname")
        userpass = request.form.get("pass")
        if username == params['admin_user'] and userpass == params['admin_password']:
            # set the session variable
            session['user'] = username
            post = posts.query.all()
            return render_template('admin.html', params=params, post=post)
        else:
            return render_template('login.html', params=params)
    return render_template('login.html',params=params)

@app.route("/createpost/<string:sno>" , methods=['GET', 'POST'])
def edit(sno):
    if "user" in session and session['user']==params['admin_user']:
        if request.method=="POST":
            box_title = request.form.get('title')
            slug = request.form.get('slug')
            content = request.form.get('content')
            date = datetime.now()


            if sno=='0':
                post = posts(title=box_title, slug=slug, content=content, date=date)
                db.session.add(post)
                db.session.commit()
                # return redirect('/edit/0')

            else:
                post = posts.query.filter_by(Sno=sno).first()
                post.title = box_title
                post.slug = slug
                post.content = content
                post.datetime = date
                db.session.commit()
                return redirect('/createpost/'+sno)
    #
        post = posts.query.filter_by(Sno=sno).first()
        return render_template('createpost.html', params=params,post=post,sno=sno)


app.run(debug=True)
