class PayslipsController < ApplicationController
  DEFAULT_NATION = 'AU'

  def new
    @payslip = Payslip.new
  end

  def create
    @payslip = Payslip.new(payslip_params)

    respond_to do |format|
      if @payslip.valid?
        format.js
      else
      end
    end
  end

  private

  def payslip_params
    permitted_params = [:first_name, :last_name, :annual_salary, :super_rate, :payment_month]
    temp_params = params.require(:payslip).permit(permitted_params)

    payment_start_date, payment_end_date = helpers.create_dates_from_month(temp_params[:payment_month])

    temp_params.except(:payment_month)
      .merge({ payment_start_date: payment_start_date,
               payment_end_date: payment_end_date,
               nation: DEFAULT_NATION })
  end
end
