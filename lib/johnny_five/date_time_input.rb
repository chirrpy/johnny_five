class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  def input
    input_value = super
    child_index = input_value.match(/id="\w+_(\d+)_"/)[1]
    %Q{<input id="#{(lookup_model_names << attribute_name).join('_')}_attributes_#{child_index}_datepicker" type="text" class="datetime string datepicker">#{input_value}}.html_safe
  end
end
