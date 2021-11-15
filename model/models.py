import subprocess

class ManageAPI:
	
	def __init__(self):
		self.path_to_dragocontrol = 'bash /home/elsire34/DragoUserControl/bash/DragoUserControl.sh'
		self.ask_who = ' -w'

	def give_me_back_who(self):
		subp =  subprocess.getoutput(self.path_to_dragocontrol + self.ask_who)
		return subp

#  vr457098
# alvise bacco
# elaborato shell
