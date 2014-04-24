class InviteMailer < ActionMailer::Base
  require "erb"
  include ERB::Util

  default from: ENV['MANDRILL_USERNAME']
  default :to => "support@memloom.com"

  def send_staff_invite(invite_info)
    @email = invite_info[:email]
    @type = invite_info[:type]
    @key = invite_info[:key]
    @program_name = invite_info[:program]
    @pname =  @program_name.split('_').join(' ').titleize

    # convert user-type to num based on alphabet position
    # 7403214027 == headcoach and 1819055 == staff
    @type == 'head_coach' ? @param = '7403214027' : @param = '1819055'

    @url = "http://#{ActionMailer::Base.smtp_settings[:domain]}/access/#{@program_name}/#{@key}-#{@param} "
    sub = "You're invited to join the #{@pname} staff"

    mail(:subject => sub,
       :to => @email,
       :reply_to => "email"
    ).deliver

  end
end
