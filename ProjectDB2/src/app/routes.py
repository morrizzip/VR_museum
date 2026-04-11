import os
from flask import request, render_template, abort, send_from_directory, flash, redirect, url_for
from werkzeug.utils import secure_filename

from src.app import db
from src.app.models import Object
from src.importer import app


@app.route('/', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        if 'file' not in request.files:
            flash('Файл не выбран', 'error')
            return redirect(url_for('upload_file'))

        file = request.files['file']

        if file.filename == '':
            flash('Файл не выбран', 'error')
            return redirect(url_for('upload_file'))

        # Проверяем существует ли файл
        existing_file = Object.query.filter_by(name=file.filename).first()
        if existing_file:
            flash(f'Файл "{file.filename}" уже существует', 'error')
            return redirect(url_for('upload_file'))

        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))

            new_object = Object(name=filename)
            db.session.add(new_object)
            db.session.commit()

            flash(f'Файл "{filename}" успешно загружен!', 'success')
            return redirect(url_for('upload_file'))
        else:
            flash('Недопустимый тип файла', 'error')
            return redirect(url_for('upload_file'))

    objects = Object.query.all()
    return render_template('main_page.html', title="Главная", objects=objects)


@app.route('/download/<int:file_id>')
def download_file(file_id):
    obj = Object.query.get(file_id)

    if obj:
        return send_from_directory('uploads', path=obj.name, as_attachment=True)
    else:
        flash('Файл не найден', 'error')
        return redirect(url_for('upload_file'))


@app.route('/delete/<int:file_id>', methods=['POST'])
def delete_file(file_id):
    obj = Object.query.get(file_id)

    if obj:
        file_path = os.path.join(app.config['UPLOAD_FOLDER'], obj.name)
        if os.path.exists(file_path):
            os.remove(file_path)

        db.session.delete(obj)
        db.session.commit()
        flash(f'Файл "{obj.name}" успешно удален!', 'success')
    else:
        flash('Файл не найден', 'error')

    return redirect(url_for('upload_file'))


ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif', 'glb', 'fbx'}


def allowed_file(filename):
    return '.' in filename and \
        filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS