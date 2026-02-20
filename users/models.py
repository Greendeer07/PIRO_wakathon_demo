from django.db import models
from django.contrib.auth.models import AbstractUser

# 일단 작동만 되게 만드는 최소한의 유저 모델
class User(AbstractUser):
    # 나중에 여기에 color_code 같은 걸 추가할 예정입니다!
    pass