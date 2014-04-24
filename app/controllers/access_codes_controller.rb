class AccessCodesController < ApplicationController

  before_action :check_access_code_exist, only: :verify_access_code


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

  def verify_access_code
    access_code_parts = params[:id].split('_')
    access_id = access_code_parts[0]
    access_code = AccessCode.find(access_id)
    user_type = access_code_parts[1]
    render text: 'next step'
  end

  private

    def check_access_code_exist
      access_code_parts = params[:id].split('_')
      access_id = access_code_parts[0]
      access_code = AccessCode.find(access_id)
      rescue ActiveRecord::RecordNotFound
        redirect_to root_path, notice: "Sorry, your access code in not valid"
    end
end
