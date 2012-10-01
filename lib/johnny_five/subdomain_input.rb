class SubdomainInput < SimpleForm::Inputs::Base
  def input
    options[:schema] ||= 'http'
    input_html_options[:class] += ' string'

    "#{options[:schema]}:// #{@builder.text_field(attribute_name, input_html_options)} .#{options[:base_url]}".html_safe
  end
end
