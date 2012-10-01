class ButtonOnlyFileInput < SimpleForm::Inputs::CollectionInput
  include JohnnyFive::ButtonHelper

  def initialize(builder, attribute_name, column, input_type, options = {})
    super(builder, attribute_name, column, input_type, options)

    @options[:components]  = [:input]
    @options[:components] += (error_text.blank? ? [:hint] : [:error])
  end

  def input
    input_html_options[:class] += ' file'

    visible_button    = small_action_button "Choose File", :id => "#{object_underscored}_#{attribute_name}_choose_button", :class => 'choose_file_button', :view_template => template
    file_input        = @builder.file_field    attribute_name,            input_html_options
    hidden_input      = @builder.hidden_field  "#{attribute_name}_cache"
    input_public_url  = object.send(attribute_name).url
    input_file_info   = '<p class="faded_text">No file attached</a>'
    image_path        = options[:image_path]
    input_remove_link = %Q{<p class="faded_text"><a href="#" class="file_removal_link dangerous_link" data-image-path="#{image_path}">Click to remove this image</a></p>}
    input_file_tag    = input_public_url.blank? ? input_file_info : input_remove_link

    "#{visible_button} #{file_input} #{hidden_input} #{input_file_tag}".html_safe
  end

  def hint
    %Q{<p class="information">#{hint_text}</p>}
  end

private
  def object_underscored
    object_name.gsub(/\[|\]/, '_').sub(/_$/, '')
  end
end
