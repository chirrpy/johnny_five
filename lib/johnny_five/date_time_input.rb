class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  def input
    %Q{<input id="#{(lookup_model_names << attribute_name).join('_')}_datepicker" type="text" class="datetime string datepicker">#{super}}.html_safe
  end
end
