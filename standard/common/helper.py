import json
import decimal
import hashlib
from ..settings import *
from simple_mysql import db as mysql
from django.http import JsonResponse


def db(name="users"):
    '''
    mysql connector
    :return:
    '''
    return mysql().connection(DATABASE).table(name)


def md5(string=''):
    '''md5 hashed '''
    return hashlib.md5(string.encode(encoding='UTF-8')).hexdigest()


class JsEncoder(json.JSONEncoder):
    '''
    # json encoder
    '''

    def default(self, o):
        if isinstance(o, decimal.Decimal):
            return float(o)
        super(JsEncoder, self).default(o)


def jsonResponse(code=1, msg='error', data=None, page=None):
    '''
    format json response
    :param code:
    :param msg:
    :param data:
    :param page:
    :return:
    '''
    if data is None:
        data = []
    if page is None:
        page = []
    return JsonResponse({"code": code, "msg": msg, "data": data, "count": page})
