class RepairNotifier < ActionMailer::Base
  default from: "strtho@gmail.com"

  def new_message(repair)
  	@repair = repair
  	#attachments.inline['fixitub-logo.png'] = File.read("fixitub-logo.png")
  	mail(to: "#{repair.email}", subject: "Din #{repair.phone_model.name} er levert til service.")
  end

  def phone_repair(repair)
  	@repair = repair
  	#attachments.inline['fixitub-logo.png'] = File.read("fixitub-logo.png")
  	mail(to: "#{repair.email}", subject: "Din #{repair.phone_model.name} er klar for henting.")
  end
end
