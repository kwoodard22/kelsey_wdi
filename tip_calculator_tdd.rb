# Exercise: Tip Calculator


# Your code goes here
#>>>>>>>>>>>>>>>>>>>>>

class TipCalculator


  def sanitize_input(meal_total)
    meal_total.delete('$').to_f
  end

  def convert_percentage_to_float(tip_amount)
    if tip_amount.include? '%'
      tip_amount.delete!('%')
      tip_amount.to_f / 100
    elsif tip_amount.to_i < 1
      tip_amount.to_f
    else 
      tip_amount.to_f / 100
    end
  end

  def tip(meal_cost, tax, tip_amount)
    cost_converted = sanitize_input(meal_cost)
    tax_converted = convert_percentage_to_float(tax) * 100
    tip_converted = convert_percentage_to_float(tip_amount) * 100
    final_cost = cost_converted + tip_converted + tax_converted

    "$#{final_cost}"
  end

end

# my_total = TipCalculator.new
# my_total.sanitize_input('$18.25')

# my_tip = TipCalculator.new
# my_tip.convert_percentage_to_float('0.05')

#<<<<<<<<<<<<<<<<<<<<<


if $0 == __FILE__

  require 'minitest/autorun'

  describe TipCalculator do
    before do
      @calculator = TipCalculator.new
    end


    describe "when the user enters a currency" do
      it "removes the dollar sign" do
        @calculator.sanitize_input('$18.25').must_equal(18.25)
      end

      it "keeps a float if a float is entered" do
       @calculator.sanitize_input('18.25').must_equal(18.25)
      end
    end # desc float

    describe "when the user enter a tip" do
      it "converts percentage into a float" do
        @calculator.convert_percentage_to_float('5%').must_equal(0.05)
        #expect (@calculator.sanitize_input($12.50)).to eql(12.50)
      end

      it "converts integer into a float" do
        @calculator.convert_percentage_to_float('5').must_equal(0.05)
      end

      it "converts integer into a float" do
        @calculator.convert_percentage_to_float('0.05').must_equal(0.05)
      end

      it "converts percentage into a float" do
        @calculator.convert_percentage_to_float('10%').must_equal(0.10)
      end

      it "converts integer into a float" do
        @calculator.convert_percentage_to_float('10').must_equal(0.10)
      end

      it "converts integer into a float" do
        @calculator.convert_percentage_to_float('0.10').must_equal(0.10)
      end

    end # desc user tip

    describe "with meal total and tip" do
      it "adds up the final cost" do
        @calculator.tip('$100', '10%', '20%').must_equal('$130.00')
      end
    end

  end # desc TipCalc
end # $0 == __FILE__



