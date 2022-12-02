import time
from django.shortcuts import redirect
from django.http import QueryDict
from ..common.helper import *


def index(request):
    '''
    direct homepage
    :param request:
    :return:
    '''
    return redirect('/dist/index.html')


def login(request):
    '''
    login
    :param request:
    :return:
    '''
    username = request.POST.get("username")
    # password = request.POST.get("password")
    # role = request.POST.get("role")

    user = db("users").where({"username": username}).find()

    if user is None:
        user = db('users').add({
            "username": username, 
            "role": 1, 
        })
        #return jsonResponse(1, 'Error username !')
    #else:
    timestamp = time.time()

    token = md5(str(user["id"]) + str(timestamp))
    db("users").table('users').where({"id": user["id"]}).save({"token": token})
    data = {
        "token": token,
        "user": user
    }
    return jsonResponse(0, 'Login Successful', data)


def register(request):
    '''
    register
    :param request:
    :return:
    '''
    username = request.POST.get("username")
    password = request.POST.get("password")

    if len(password) > 10 or len(password) < 6:
        return jsonResponse(1, 'password is error')

    result = db("users").where({"username": username}).find()

    if result:
        return jsonResponse(1, 'The user name already exists')

    user = db('users').add({
        "username": username
    })

    if user:
        return jsonResponse(0, 'Success！')

    return jsonResponse(1, 'Fail！')


def gen_plan(request):
    '''
    generated student plan
    :param request:
    :return:
    '''
    degree = request.POST.get("degree")
    major = request.POST.get("major")
    token = request.POST.get("token")
    year = request.POST.get("year")
    season = request.POST.get("season")
    
    degree_id = db("degrees").where({"name": degree}).find()["id"]
    major_degree = db("major").where({"name": major}).find()["d_id"]
    if (degree_id != major_degree):
        return jsonResponse(1, "Incorrect major or degree")

    where = {}

    if degree:
        where["degree"] = degree
    if major:
        where["major"] = major

    rows = db("course").where(where).select()

    user = db("users").where({"token": token}).find()

    if user["plan"] == 1:
        return jsonResponse(0, 'The plan has been generated！')

    for i in rows:
        data = {
            "uid": user["id"],
            "cid": i["id"],
            "level": i["level"],
            "season": i["season"],
            "passlevel": -1,

        }
        db("plans").add(data)

    db("users").where({"token": token}).save({"plan": 1})
    return jsonResponse(0, 'Success')

def degree(request):
    if request.method == "GET":
        rows = db("degrees").select()
        return jsonResponse(0, "success", rows)

def major(request):
    if request.method == "GET":
        rows = db("major").select()
        return jsonResponse(0, "success", rows)

    elif request.method == "POST":
        major = request.POST.get("major")
        degree = db("degrees").where({"name": request.POST.get("degree")}).find()
        data = {
            "name": major,
            "d_id": degree["id"],
        }
        print(data)
        res = db("major").add(data)
        if not res:
            return jsonResponse(1, "Fail")
        return jsonResponse(0, 'Success')
    
    elif request.method == "DELETE":
        print(request.GET.get("id"))
        res = db("major").where({"id":request.GET.get("id")}).delete()
        if not res:
            return jsonResponse(1, "Fail")
        return jsonResponse(0, 'Success')


def plan(request):
    if request.method == "GET":
        degree = request.GET.get("degree")
        major = request.GET.get("major")
        level = request.GET.get("level")
        season = request.GET.get("season")
        token = request.GET.get("token")

        where = {}

        if degree:
            where["degree"] = degree
        if major:
            where["major"] = major
        if level:
            where["a.level"] = level
        if season:
            where["a.season"] = season

        user = db("users").where({"token": token}).find()
        where["uid"] = user["id"]

        if where:
            result = db("plans").where(where).alias('a').join(['course c on c.id = a.cid', 'left']).field(
                'a.*,c.title,c.degree,c.major,c.code,c.offered').select()
            # print(result)
        else:
            result = db("plans").select()

        return jsonResponse(0, 'Success！', result)
    elif request.method == "POST":
        token = request.POST.get("token")
        cid = request.POST.get("cid")

        user = db("users").where({"token": token}).find()
        course = db("course").where({"id": cid}).find()

        has_course = db("plans").where({"uid": user["id"], "cid": course["id"]}).find()

        if has_course:
            return jsonResponse(1, "The course already exists")

        data = {
            "uid": user["id"],
            "cid": course["id"],
            "level": course["level"],
            "season": course["season"],
            "passlevel": -1,
        }
        res = db("plans").add(data)
        if not res:
            return jsonResponse(1, "Fail")
        return jsonResponse(0, 'Success')

    elif request.method == "PUT":
        put = QueryDict(request.body)

        level = put.get("level")
        season = put.get("season")
        passlevel = put.get("passlevel")

        data = {}

        if level:
            data["level"] = level
        if season:
            data["season"] = season
        if passlevel:
            data["passlevel"] = passlevel

        if not data:
            return jsonResponse(1, "Error Params !")

        res = db("plans").where({"id": put.get("id")}).save(data)
        if not res:
            return jsonResponse(1, "Update Fail")

        return jsonResponse(0, "Sucess")


    elif request.method == "DELETE":
        res = db("plans").where({"id": request.GET.get("id")}).delete()
        if not res:
            return jsonResponse(1, "Delete Fail")

        return jsonResponse(0, "Delete Sucess")


def course(request):
    '''
    get all course
    :param request:
    :return:
    '''
    if request.method == "GET":
        degree = request.GET.get("degree")
        major = request.GET.get("major")
        level = request.GET.get("year")
        season = request.GET.get("season")
        cid = request.GET.get("cid")

        where = {}

        if degree:
            where["degree"] = degree
        if major:
            where["major"] = major
        if level:
            where["level"] = level
        if season:
            where["season"] = season
        if cid:
            where["id"] = cid

        if where:
            result = db("course").where(where).select()
        else:
            result = db("course").select()

        return jsonResponse(0, 'Success！', result)
    elif request.method == "POST":
        param = QueryDict(request.body)

        data = {
            "degree": param.get("degree"),
            "major": param.get("major"),
            "code": param.get("code"),
            "title": param.get("title"),
            "level": param.get("level"),
            "season": param.get("season"),
            "credits": param.get("credits"),
            "passscore": param.get("passscore"),
            "offered": param.get("offered"),
            "pre_id": param.get("pre_id")
        }
        print(data)

        if not data["pre_id"]:
            del data["pre_id"]

        res = db("course").add(data)

        if not res:
            return jsonResponse(1, "Error Param!")
        return jsonResponse(0, "Success")
    elif request.method == "PUT":
        param = QueryDict(request.body)

        data = {
            "degree": param.get("degree"),
            "major": param.get("major"),
            "code": param.get("code"),
            "title": param.get("title"),
            "level": param.get("level"),
            "season": param.get("season"),
            "credits": param.get("credits"),
            "passscore": param.get("passscore"),
            "offered": param.get("offered"),
            "pre_id": param.get("pre_id", "")
        }
        print(data)
        res = db("course").where({"id": param.get("id")}).save(data)

        if not res:
            return jsonResponse(1, "Error Param!")
        return jsonResponse(0, "Success")

    elif request.method == "DELETE":
        res = db("course").where({"id": request.GET.get("id")}).delete()
        if not res:
            return jsonResponse(1, "Delete Fail")

        return jsonResponse(0, "Delete Sucess")


def check(request):
    degree = request.POST.get("degree")
    major = request.POST.get("major")
    token = request.POST.get("token")

    where = {}

    if degree:
        where["degree"] = degree
    if major:
        where["major"] = major

    user = db("users").where({"token": token}).find()
    where["uid"] = user["id"]

    require_course = db("course").where({
        "a.degree": degree,
        "a.major": major
    }).where("b.id is null").alias('a').join(
        [f'plans b on a.id = b.cid and b.uid = {user["id"]}', 'left']).field(
        'a.*,b.id').select()

    if require_course and len(require_course) >= 1:
        if not require_course[0]["code"]:
            code = require_course[0]["title"]
        else:
            code = require_course[0]["code"]

        return jsonResponse(1, f"Miss {code} (year {require_course[0]['level'] + 1} {require_course[0]['season']})")

    result = db("plans").where(where).alias('a').join(['course c on c.id = a.cid', 'left']).field(
        'a.*,c.title,c.degree,c.major,c.code,c.credits,c.pre_id,c.passscore,c.offered').select()
    # print(result)
    total = 0
    for i in result:
        if i["season"] not in i["offered"]:
            return jsonResponse(1, f"{i['code']} {i['title']} is not offered in {i['season']}")

        if i["pre_id"]:
            pre_id = i["pre_id"].split(",")
            pre_pass = False
            for j in pre_id:
                pre_course = db("plans").where({"uid": user["id"], "cid": j}).find()
                course_info = db("course").where({"id": j}).find()

                if pre_course:
                    print(pre_course["level"], i["level"])

                    if i["code"].strip().lower() == "math2114":
                        if course_info['code'].strip().lower() == "math1226":
                            pre_pass = True
                            break
                        if pre_course["level"] < 3:
                            pre_pass = True
                            break
                    else:
                        pre_pass = True

                    print(pre_course["level"], i["level"])

                    if pre_course["level"] > i["level"]:
                        return jsonResponse(1,
                                            f"{course_info['code']} {course_info['title']} is the pre course of {i['code']} {i['title']}")

                    if pre_course['level'] == i['level'] and pre_course['season'] == i['season']:
                        return jsonResponse(1,
                                            f"{course_info['code']} {course_info['title']} is the pre course of {i['code']} {i['title']}")

                    if pre_course["passlevel"] == -1:
                        continue

                    if pre_course["passlevel"] > course_info["passscore"]:
                        return jsonResponse(1, "Failed to pass the pre-course {} {}".format(course_info["code"],
                                                                                            course_info['title']))

            if not pre_pass:
                return jsonResponse(1, "Failed to pass the pre-course of {} {}".format(i["code"], i["title"]))

        if i["passlevel"] == -1 or i["passlevel"] <= i["passscore"] or i["passlevel"] == 13: # passlevel = 13 for T:
            total = total + i["credits"]
            continue
        elif i["passlevel"] > i["passscore"]:
            return jsonResponse(1, "Failed to pass the course {} {}".format(i["code"], i['title']))

    if total < 131:
        return jsonResponse(0, "Not enough credits", total)

    return jsonResponse(0, "Your plan of study is valid!")
