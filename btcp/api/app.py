from flask import Flask, render_template, request,url_for,redirect,flash

app = Flask(__name__)
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'

posts =[
{
	'question':'hello',
	'answer':'world'
}
]

word=[{
	'keyword':'goodbye'
}]


@app.route('/')
def index():
    return render_template('main.html')

@app.route('/directory')
def godirectory():
    return render_template('directory.html')

@app.route('/search',methods=['GET','POST'])
def search():
	if request.method=="POST" and "keyword" in request.form:
		search_keyword=request.form['keyword']
		word.append({'word':search_keyword})
		flash('You have search the keyword')
		return render_template('main.html')
	if request.method=="POST" and "question" in request.form:
		newquestion=request.form['question']
		newanswer=request.form['answer']
		posts.append({'question':newquestion,'answer':newanswer})
		print (posts)
		flash('Your database has been update')
		return render_template('main.html')
	else:
		return render_template('search.html')

"""
@app.route('/search',methods=['GET','POST'])
def search():
	if request.method=="POST":
		foundkeyword=request.form['keyword']
		posts.append({'keyword':foundkeyword})
		key.append({'keyword':foundkeyword})
		return render_template('about.html',title='search',posts=posts,key=key)
	else:
		return render_template('about.html',title='search',posts=posts,key=key)
		"""
if __name__ == '__main__':
    app.run(debug=True)
