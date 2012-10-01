class DetailedRadioInput < SimpleForm::Inputs::CollectionInput
  def input
    @builder.radio_button  attribute_name, options[:value], input_html_options
  end

  def label_html_options
    options = super
    options[:class] << ' radio collection_radio'
    options
  end

  def input_html_options
    options = super
    options[:class] << ' radio collection_radio'
    options
  end

  def input_html_classes
    super + ['radio', 'collection_radio']
  end

  def label_input
    return <<-FORMALICIOUS
      <div class="radio_input_wrapper radio_collection_input_wrapper">
        #{input}
      </div>
      #{label}
      <div class="radio_details">#{options[:details]}</div>
      <div class="radio_help_button_wrapper radio_collection_help_button_wrapper">
        #{%Q{<div class="help_button" data-help_text='#{hint_text}'></div>} unless hint_text.blank?}
      </div>
    FORMALICIOUS
  end

  def wrapper_html_options
    input_html_classes

    css_classes = input_html_classes.unshift(wrapper_class)
    css_classes << wrapper_error_class if has_errors?
    css_classes << disabled_class if disabled?

    html_options_for(:wrapper, css_classes)
  end

protected
  def components_list
    (options[:components] || SimpleForm.components) - [:hint]
  end
end
