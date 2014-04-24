class AccessCodesController < ApplicationController

  def send_access_code
    program_id = current_user.program_id
    invite = AccessCode.create(program_id: program_id)
    user_type = params[:user_type]
    receipent_email = params[:email]
    access_key = invite.access_code
    program = Program.find(program_id)
    program_name = program.town_name + '_' + program.team_name
    invite_info = {
      email:  receipent_email,
      type:   user_type,
      key:    access_key,
      program:  program_name
    }

    InviteMailer.send_staff_invite(invite_info).deliver
    redirect_to(:back)
  end


end
