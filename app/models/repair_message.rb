# encoding: utf-8
class RepairMessage
	@repair = Repair.find(params[:id])
	name: @repair.name
	email: @repair.email
	
end