class SupportRequestsController < ApplicationController

  def new
    @support_request = SupportRequest.new
  end

  def create
    @support_request = SupportRequest.new(support_request_params)
    if @support_request.save
      redirect_to new_support_request_path, notice: 'Support Request created.'
    else
      render :new
    end
  end

  private

  def support_request_params
    params.require(:support_request).permit(:message, :subject, :beespew)
  end
end
