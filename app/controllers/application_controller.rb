class ApplicationController < ActionController::Base
  def blank_square_form

    render({:template =>  "calculation_templates/square_form.html.erb"})
  end


  # params = {"number"=>"42"}
  def calculate_square
    @num = params.fetch("number").to_f
    @square_of_num = @num * @num
    render({:template => "calculation_templates/square_results.html.erb"})
  end

  def blank_root_form
    render({:template => "calculation_templates/square_root_form.html.erb"})
  end

  def calculate_root

    @num = params.fetch("number").to_f
    @sqrt_of_num = @num ** 0.5
    render({:template => "calculation_templates/square_root_results.html.erb"})

  end

  def blank_payment_form
    render({:template => "calculation_templates/payment_form.html.erb"})
  end
  
  def calculate_payment
    @apr = params.fetch("apr").to_f
    @years = params.fetch("years").to_f.round(0)
    @principal = params.fetch("principal").to_f

    @principal_rounded = @principal.to_s(:currency)
    @apr_rounded = @apr.to_s(:percentage, {:precision => 4})

    @apr_calc = @apr/100/12
    @periods = @years*12

    @numerator = @apr_calc * @principal
    @denominator = 1 -(1+@apr_calc)**(-@periods)

    @calculation = @numerator / @denominator
    @payment = @calculation.to_s(:currency)
    render({:template => "calculation_templates/payment_calculation.html.erb"})
  end




end
