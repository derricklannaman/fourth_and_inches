class AccessCodesController < ApplicationController

  def send_access_code
    code = generate_key
    ac = AccessCode.create(access_code: code,
                           program_id: current_user.program_id)
    binding.pry
    redirect_to(:back)
  end


end
