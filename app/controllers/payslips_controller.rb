class PayslipsController < ApplicationController
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
    permitted_params = [:first_name, :last_name, :annual_salary, :super_rate,
                        :payment_start_date, :payment_end_date]
    params.require(:payslip).permit(permitted_params)
  end
end
