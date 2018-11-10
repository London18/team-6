from flask import Flask, render_template, request, url_for, redirect

app = Flask(__name__)

posts = [
    {
        'keyword': 'hello'
    }, {
        'keyword': 'world'
    }
]

key = [
    {
        'keyword': 'hello'
    }, {
        'keyword': 'world'
    }
]


@app.route('/')
def hello_world():
    return render_template('home.html')


@app.route('/search', methods=['GET', 'POST'])
def search():
    if request.method == "POST":
        foundkeyword = request.form['keyword']
        posts.append({'keyword': foundkeyword})
        return render_template('about.html', title='search', posts=posts, key=key)
    else:
        return render_template('about.html', title='search', posts=posts, key=key)


if __name__ == '__main__':
    app.run(debug=True)
