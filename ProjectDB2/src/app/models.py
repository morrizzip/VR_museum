# from datetime import datetime
#
# from src.app import db
#
#
# class Object(db.Model):
#     id = db.Column(db.Integer, primary_key=True)
#     name = db.Column(db.String(100), nullable=False)
#     download_time = db.Column(db.DateTime, default=datetime.utcnow)
#
#     def __repr__(self):
#         return f"Object('{self.name}' with id  '{self.id}')"


from datetime import datetime
from src.app import db


class Rack(db.Model):
    __tablename__ = 'rack'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False, unique=True)

    # Связь с таблицей Mineral (один ко многим)
    minerals = db.relationship('Mineral', backref='rack', lazy=True)

    def __repr__(self):
        return f"Rack('{self.name}')"


class Mineral(db.Model):
    __tablename__ = 'mineral'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    model = db.Column(db.String(200), nullable=False)  # путь к файлу модели
    description = db.Column(db.Text, nullable=True)
    download_time = db.Column(db.DateTime, default=datetime.utcnow)

    # Внешние ключи
    id_rack = db.Column(db.Integer, db.ForeignKey('rack.id'), nullable=False)
    num_shelf = db.Column(db.Integer, nullable=False)
    num_position = db.Column(db.Integer, nullable=False)

    def __repr__(self):
        return f"Mineral('{self.name}', rack_id={self.id_rack}, shelf={self.num_shelf}, pos={self.num_position})"