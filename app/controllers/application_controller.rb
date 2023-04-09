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


end
