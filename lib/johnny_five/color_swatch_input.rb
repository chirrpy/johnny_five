class ColorSwatchInput < SimpleForm::Inputs::Base
  def input
    color         = input_html_options[:value] || @builder.object.send(attribute_name)
    color         = "##{color}" unless color == 'transparent'

    default_color = Page::DEFAULT_COLORS[attribute_name]
    default_color = "##{default_color}" unless color == 'transparent'

    live  = options[:live] || ["", ""]

    %Q{<div class="color_swatch_container"><div data-original-color="#{color}" data-default-color="#{default_color}" data-bind-preview-click="#{!options[:no_click_binding]}" data-live="#{live[0]}" data-property="#{live[1]}" data-widget="color_swatch" class="color_swatch" style="background-color: #{color};">#{@builder.hidden_field(attribute_name, input_html_options)}</div></div>}
  end

  def label_input
    input + (options[:label] == false ? "" : label)
  end
end
