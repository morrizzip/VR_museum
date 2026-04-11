from datetime import datetime

from src.app import db


class Object(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    download_time = db.Column(db.DateTime, default=datetime.utcnow)

    def __repr__(self):
        return f"Object('{self.name}' with id  '{self.id}')"
