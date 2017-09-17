require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PayslipsHelper. For example:
#
# describe PayslipsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PayslipsHelper, type: :helper do
  describe '#create_dates_from_month' do
    subject { helper.create_dates_from_month(month) }

    context "with valid month" do
      let(:month) { '03/2017' }
      begin_of_month = '03/2017'.to_date.beginning_of_month
      end_of_month = '03/2017'.to_date.end_of_month

      it { is_expected.to eq [begin_of_month, end_of_month] }
    end

    context 'with invalid month' do
      let(:month) { 'foo' }

      it { is_expected.to eq [nil, nil] }
    end
  end

  describe '#full_name' do
    subject { helper.full_name(first_name, last_name) }

    let(:first_name) { 'Vinh' }
    let(:last_name) { 'To' }

    it { is_expected.to eq 'Vinh To' }
  end

  describe '#pay_period' do
    subject { helper.pay_period(date) }

    context 'with valid date' do
      let(:date) { '01/01/2017' }

      it { is_expected.to eq 'January 2017' }
    end

    context 'with invalid date' do
      let(:date) { 'foo' }

      it { is_expected.to eq '' }
    end
  end
end
