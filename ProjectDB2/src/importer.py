# from app import db, create_app
# from app.models import User, Relation, Message, Chat

from src.config import Config
from src.app import create_app

app = create_app(Config)

from src.app import routes
from src.app import models