@app.route('/', methods=['GET', 'POST'])
def upload_file():
        if request.method == 'POST':
            file = request.form.get("fname")
            if file.endswith('txt'):
                return redirect(url_for('download_file',name=file))
            if file.endswith('zip'):
                
                with zipfile.ZipFile(file,'r') as zipref:
                    zipref.extractall(r'/ws/viselvar-sjc/test/logfile22/NEWFLASK-MAIN')
            return redirect(url_for('download_file',name=file))

        return render_template('mainpage.html')
app.add_url_rule(
    "/uploads/<name>", endpoint="download_file", build_only=True
)
