class StaticPagesController < ApplicationController
  def index
    contextio = ContextIO.new(ENV['CONTEXTIOKEY'], ENV['CONTEXTIOSECRET'])
    account = contextio.accounts.where(email: ENV['MYEMAIL']).first
    @subj_array = []

    account.messages.where(limit: 5).each do |message|
      @subj = message.subject
      @subj_array << @subj
    end


  end
end
