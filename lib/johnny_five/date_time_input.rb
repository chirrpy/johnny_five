class DateTimeInput < SimpleForm::Inputs::DateTimeInput
  def input
    %Q{<input type="text" class="datetime string datepicker">#{super}}.html_safe
  end
end
