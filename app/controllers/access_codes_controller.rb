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
      program:  program_name,
      program_id: program_id
    }

    InviteMailer.send_staff_invite(invite_info).deliver
    redirect_to(:back)
  end

  def verify_access_code
    handle_access_code_on_arrival
    user_type = params[:id].split('-')[1]
    if user_type == '7403214027'
      redirect_to new_user_registration_path(key: params[:id])
    elsif user_type == '1819055'
      redirect_to new_user_registration_path(key: params[:id])
    else
      redirect_to root_path, notice: "Sorry, your access code is NOT valid!"
    end
  end

  private

    def handle_access_code_on_arrival
      access_code_parts = params[:id].split('-')
      access_id = access_code_parts[0]
      access_code = AccessCode.find_by_access_code(access_id)
    end

    def reject_if_access_code_taken(code)
      if code.blank? || code.user_id.present?
        redirect_to root_path, notice: "Sorry, this access link is not valid \n
                          . Please contact the program director."
        # return
      end
      # if code.user_id.present?
      #   redirect_to root_path, notice: "Sorry, this access code belongs\n
      #                     to someone else. Please contact the program director."
      # end
    end

    def check_access_code_exist
      ac = handle_access_code_on_arrival
      reject_if_access_code_taken(ac)
      rescue ActiveRecord::RecordNotFound
        redirect_to root_path, notice: "Sorry, your access code is NOT valid. \n
                                          Please contact the program director."
    end




end
