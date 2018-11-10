from flask import Flask, render_template, request,url_for,redirect,flash

app = Flask(__name__)
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'

posts =[
{
	'question':'hello',
	'answer':'world'
},{
	'question':'how are you',
	'answer':'world'
},{
	'question':'hello worlddddd',
	'answer':'world'
}
]

word=[{
	'keyword':''
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
		search_question=request.form['keyword']
		word.append({'keyword':search_question})
		print(word)
		flash('You have search for the keyword')
		return render_template('result.html',posts=posts,word=word)
	if request.method=="POST" and "question" in request.form:
		newquestion=request.form['question']
		newanswer=request.form['answer']
		posts.append({'question':newquestion,'answer':newanswer})
		print (posts)
		flash('Your database has been update')
		return render_template('main.html')
	else:
		return render_template('search.html',posts=posts)

@app.route('/result')
def result():
    return render_template('result.html',word=word)

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
