class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  def input
    input_value = super
    child_index = input_value.match(/id="\w+_(\d+_\w+i)/)[1] rescue nil

    if child_index
      child_index = "_attributes_#{child_index}"
    else
      child_index = "_#{attribute_name}"
    end

    %Q{<input data-id="#{(lookup_model_names).join('_')}#{child_index}_datepicker" type="text" class="datetime string datepicker">#{input_value}}.html_safe
  end
end
