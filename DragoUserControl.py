try:
	from quart import Quart
except ImportError:
	raise ImportError('Quart import error :(')

def create_app():
	application = Quart(__name__)
	from api.apis import api_drago_user_control
	application.register_blueprint(api_drago_user_control(), url_prefix='/api')
	return application

if __name__=='__main__':
	app = create_app()
	# modificare host in base a dove si vuole bindare l'api
	app.run(host='0.0.0.0', port=5001, use_reloader=False, debug=False)

#  vr457098
# alvise bacco
# elaborato shell
