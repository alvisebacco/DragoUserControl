from quart import Blueprint
from quart import jsonify
from model.models import *

def api_drago_user_control():
    api_drago_user_control = Blueprint('drago_user_control_api', __name__)
    @api_drago_user_control.route('/give_me_who_is_connected', methods=['GET'])
    async def give_me_how_is_connected():
        return jsonify(ManageAPI().give_me_back_who())


    return api_drago_user_control

#  vr457098
# alvise bacco
# elaborato shell
