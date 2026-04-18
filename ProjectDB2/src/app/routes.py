# import os
# from flask import request, render_template, abort, send_from_directory, flash, redirect, url_for
# from werkzeug.utils import secure_filename
#
# from src.app import db
# from src.app.models import Object
# from src.importer import app
#
#
# @app.route('/', methods=['GET', 'POST'])
# def upload_file():
#     if request.method == 'POST':
#         if 'file' not in request.files:
#             flash('Файл не выбран', 'error')
#             return redirect(url_for('upload_file'))
#
#         file = request.files['file']
#
#         if file.filename == '':
#             flash('Файл не выбран', 'error')
#             return redirect(url_for('upload_file'))
#
#         # Проверяем существует ли файл
#         existing_file = Object.query.filter_by(name=file.filename).first()
#         if existing_file:
#             flash(f'Файл "{file.filename}" уже существует', 'error')
#             return redirect(url_for('upload_file'))
#
#         if file and allowed_file(file.filename):
#             filename = secure_filename(file.filename)
#             file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
#
#             new_object = Object(name=filename)
#             db.session.add(new_object)
#             db.session.commit()
#
#             flash(f'Файл "{filename}" успешно загружен!', 'success')
#             return redirect(url_for('upload_file'))
#         else:
#             flash('Недопустимый тип файла', 'error')
#             return redirect(url_for('upload_file'))
#
#     objects = Object.query.all()
#     return render_template('main_page.html', title="Главная", objects=objects)
#
#
# @app.route('/download/<int:file_id>')
# def download_file(file_id):
#     obj = Object.query.get(file_id)
#
#     if obj:
#         return send_from_directory('uploads', path=obj.name, as_attachment=True)
#     else:
#         flash('Файл не найден', 'error')
#         return redirect(url_for('upload_file'))
#
#
# @app.route('/delete/<int:file_id>', methods=['POST'])
# def delete_file(file_id):
#     obj = Object.query.get(file_id)
#
#     if obj:
#         file_path = os.path.join(app.config['UPLOAD_FOLDER'], obj.name)
#         if os.path.exists(file_path):
#             os.remove(file_path)
#
#         db.session.delete(obj)
#         db.session.commit()
#         flash(f'Файл "{obj.name}" успешно удален!', 'success')
#     else:
#         flash('Файл не найден', 'error')
#
#     return redirect(url_for('upload_file'))
#
#
# ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif', 'glb', 'fbx'}
#
#
# def allowed_file(filename):
#     return '.' in filename and \
#         filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

import os
from flask import request, render_template, abort, send_from_directory, flash, redirect, url_for
from werkzeug.utils import secure_filename

from src.app import db
from src.app.models import Mineral, Rack
from src.importer import app


@app.route('/', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        # Получаем данные из формы
        name = request.form.get('name')
        description = request.form.get('description')
        id_rack = request.form.get('id_rack')
        num_shelf = request.form.get('num_shelf')
        num_position = request.form.get('num_position')

        # Проверка на наличие файла
        if 'file' not in request.files:
            flash('Файл с моделью не выбран', 'error')
            return redirect(url_for('upload_file'))

        file = request.files['file']

        # Валидация полей
        if not name:
            flash('Введите название минерала', 'error')
            return redirect(url_for('upload_file'))

        if not id_rack:
            flash('Выберите стеллаж', 'error')
            return redirect(url_for('upload_file'))

        if not num_shelf:
            flash('Укажите номер полки', 'error')
            return redirect(url_for('upload_file'))

        if not num_position:
            flash('Укажите номер позиции', 'error')
            return redirect(url_for('upload_file'))

        if file.filename == '':
            flash('Файл с моделью не выбран', 'error')
            return redirect(url_for('upload_file'))

        # Проверяем существует ли минерал с таким названием
        existing_mineral = Mineral.query.filter_by(name=name).first()
        if existing_mineral:
            flash(f'Минерал "{name}" уже существует', 'error')
            return redirect(url_for('upload_file'))

        # Проверяем существование стеллажа
        rack = Rack.query.get(id_rack)
        if not rack:
            flash('Выбранный стеллаж не существует', 'error')
            return redirect(url_for('upload_file'))

        # Проверяем, свободно ли место на полке/позиции
        existing_position = Mineral.query.filter_by(
            id_rack=id_rack,
            num_shelf=num_shelf,
            num_position=num_position
        ).first()

        if existing_position:
            flash(
                f'Место (стеллаж: {rack.name}, полка: {num_shelf}, позиция: {num_position}) уже занято минералом "{existing_position.name}"',
                'error')
            return redirect(url_for('upload_file'))

        # Сохраняем файл
        if file and allowed_file(file.filename):
            # Создаем уникальное имя файла
            original_filename = secure_filename(file.filename)
            filename = f"{name}_{original_filename}"
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))

            # Создаем запись в БД
            new_mineral = Mineral(
                name=name,
                model=filename,
                description=description,
                id_rack=int(id_rack),
                num_shelf=int(num_shelf),
                num_position=int(num_position)
            )

            db.session.add(new_mineral)
            db.session.commit()

            flash(f'Минерал "{name}" успешно добавлен!', 'success')
            return redirect(url_for('upload_file'))
        else:
            flash('Недопустимый тип файла. Разрешены: ' + ', '.join(ALLOWED_EXTENSIONS), 'error')
            return redirect(url_for('upload_file'))

    # GET запрос - отображаем страницу
    minerals = Mineral.query.all()
    racks = Rack.query.all()
    return render_template('main_page.html', title="Коллекция минералов", minerals=minerals, racks=racks)


@app.route('/download/<int:mineral_id>')
def download_file(mineral_id):
    mineral = Mineral.query.get(mineral_id)

    if mineral:
        return send_from_directory('uploads', path=mineral.model, as_attachment=True)
    else:
        flash('Модель минерала не найдена', 'error')
        return redirect(url_for('upload_file'))

# @app.route('/download/<int:file_id>')
# def download_file(file_id):
#     obj = Object.query.get(file_id)
#
#     if obj:
#         return send_from_directory('uploads', path=obj.name, as_attachment=True)
#     else:
#         flash('Файл не найден', 'error')
#         return redirect(url_for('upload_file'))


@app.route('/delete/<int:mineral_id>', methods=['POST'])
def delete_file(mineral_id):
    mineral = Mineral.query.get(mineral_id)

    if mineral:
        # Удаляем файл с диска
        file_path = os.path.join(app.config['UPLOAD_FOLDER'], mineral.model)
        if os.path.exists(file_path):
            os.remove(file_path)

        # Удаляем запись из БД
        db.session.delete(mineral)
        db.session.commit()
        flash(f'Минерал "{mineral.name}" успешно удален!', 'success')
    else:
        flash('Минерал не найден', 'error')

    return redirect(url_for('upload_file'))


# Маршруты для управления стеллажами
@app.route('/racks')
def list_racks():
    racks = Rack.query.all()
    return render_template('racks.html', title="Стеллажи", racks=racks)


@app.route('/add_rack', methods=['POST'])
def add_rack():
    rack_name = request.form.get('rack_name')

    if not rack_name:
        flash('Введите название стеллажа', 'error')
        return redirect(url_for('list_racks'))

    existing_rack = Rack.query.filter_by(name=rack_name).first()
    if existing_rack:
        flash(f'Стеллаж "{rack_name}" уже существует', 'error')
        return redirect(url_for('list_racks'))

    new_rack = Rack(name=rack_name)
    db.session.add(new_rack)
    db.session.commit()

    flash(f'Стеллаж "{rack_name}" успешно добавлен!', 'success')
    return redirect(url_for('list_racks'))


@app.route('/delete_rack/<int:rack_id>', methods=['POST'])
def delete_rack(rack_id):
    rack = Rack.query.get(rack_id)

    if not rack:
        flash('Стеллаж не найден', 'error')
        return redirect(url_for('list_racks'))

    # Проверяем, есть ли минералы на этом стеллаже
    minerals_on_rack = Mineral.query.filter_by(id_rack=rack_id).count()

    if minerals_on_rack > 0:
        flash(f'Невозможно удалить стеллаж "{rack.name}", так как на нем находятся минералы ({minerals_on_rack} шт.)',
              'error')
        return redirect(url_for('list_racks'))

    db.session.delete(rack)
    db.session.commit()
    flash(f'Стеллаж "{rack.name}" успешно удален!', 'success')
    return redirect(url_for('list_racks'))


ALLOWED_EXTENSIONS = {'txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif', 'glb', 'fbx', 'obj', 'stl'}


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


# Добавьте этот маршрут для API
@app.route('/api/minerals')
def api_minerals():
    minerals = Mineral.query.all()
    racks = Rack.query.all()

    # Создаем словарь для быстрого доступа к стеллажам
    racks_dict = {rack.id: rack.name for rack in racks}

    minerals_list = []
    for mineral in minerals:
        minerals_list.append({
            'id': mineral.id,
            'name': mineral.name,
            'description': mineral.description,
            'model': mineral.model,
            'id_rack': mineral.id_rack,
            'rack_name': racks_dict.get(mineral.id_rack, 'Неизвестно'),
            'num_shelf': mineral.num_shelf,
            'num_position': mineral.num_position,
            'download_time': mineral.download_time.strftime('%d.%m.%Y %H:%M')
        })

    return {'minerals': minerals_list}