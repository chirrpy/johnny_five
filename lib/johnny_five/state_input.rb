class StateInput < SimpleForm::Inputs::Base
  def input
    @builder.select(attribute_name, ::US_STATES, options, input_html_options)
  end
end
